import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:http/http.dart" as http;
import 'package:new_practo_app/otp_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController numberController = TextEditingController();

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    numberController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isActive = numberController.text.length >= 10;
    });
  }

  sendOtp(String code, String phone) async {
    try {
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
        AnimatedSnackBar.material(msg,
                type: AnimatedSnackBarType.success,
                duration: Duration(seconds: 3))
            .show(
          context,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                    phoneNumber: phone,
                  )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }
    } catch (e) {
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
                  const Text(
                    "Enter your mobile number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: numberController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    decoration: InputDecoration(
                      labelText: 'Mobile number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "By continuing, you agree to our ",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                  // RichText(
                  //     text: const TextSpan(children: [
                  //   TextSpan(
                  //     text: "By continuing, you agree to our ",
                  //     style: TextStyle(color: Colors.grey, fontSize: 18),
                  //   ),
                  //   TextSpan(
                  //     text: "Terms & Conditions",
                  //     style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //       color: Colors.blue,
                  //       fontSize: 18,
                  //     ),
                  //   )
                  // ])),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [],
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => sendOtp("91", numberController.text),
                  child: Container(
                    height: 40,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.blue
                          : const Color.fromARGB(255, 225, 224, 240),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
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
