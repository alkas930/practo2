import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_practo_app/home.dart';

import 'package:pinput/pinput.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  bool isActive = false;
  bool setloader = false;
  bool setotploader = false;
  void _updateButtonState() {
    setState(() {
      isActive = otpController.text.length == 4;
    });
  }

  initState() {
    super.initState();
    otpController.addListener(_updateButtonState);
  }

  savedata(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isloggedIn', value);
  }

//function for verify
  verifyOtp() async {
    try {
      setState(() {
        setloader = true;
      });

      final response = await http
          .post(Uri.parse("http://172.93.54.177:3001/advocate/confirmation"),
              body: jsonEncode({
                "otp": otpController.text,
                "mobile_number": widget.phoneNumber,
              }),
              headers: {"Content-Type": "application/json"});
      print(response.body);
      var data = jsonDecode(response.body);

      final String msg = data["msg"];

      if (data["status"] = true) {
        final isloggedIn = await savedata(true);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (routes) => false);

        AnimatedSnackBar.material(msg,
                type: AnimatedSnackBarType.success,
                duration: const Duration(seconds: 3))
            .show(
          context,
        );
        setState(() {
          setloader = false;
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      }
    } catch (e) {
      print(e);
    }
  }

//function for send otp

  sendOtp(String code, String phone) async {
    try {
      setState(() {
        setotploader = true;
      });
      final response = await http
          .post(Uri.parse('http://172.93.54.177:3001/advocate/signin'),
              body: jsonEncode(
                {
                  "country_code": code,
                  "mobile_number": phone,
                },
              ),
              headers: {"Content-Type": "application/json"});
      print(response.body);
      var data = jsonDecode(response.body);

      final String msg = data["msg"];

      if (data['status'] == true) {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(msg)));
        AnimatedSnackBar.material(msg,
                type: AnimatedSnackBarType.success,
                duration: const Duration(seconds: 3))
            .show(
          context,
        );
        setState(() {
          setotploader = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }

      setState(() {
        setotploader = false;
      });
    } catch (e) {
      setState(() {
        setotploader = false;
      });
      if (kDebugMode) {
        print(e);
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                minRadius: 10,
                child: Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Help",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "Enter the 6-digit OTP sent to ${widget.phoneNumber}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Pinput(
                      controller: otpController,
                      length: 4,
                      defaultPinTheme: PinTheme(
                          width: 46,
                          height: 66,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Text("Didn't receive the the code?  ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          )),
                      GestureDetector(
                        onTap: () {
                          sendOtp("91", widget.phoneNumber);
                        },
                        child: setotploader
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : Text("Resend",
                                style: TextStyle(
                                    color: Color(0xff4399b2),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const Text(
                    "Get OTP on call",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    verifyOtp();
                  },
                  child: Container(
                    height: 40,
                    width: size.width,
                    decoration: BoxDecoration(
                        color:
                            isActive ? Colors.blue : const Color(0xffb3b6bf)),
                    child: Center(
                      child: setloader
                          ? const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
