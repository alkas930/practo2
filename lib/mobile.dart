import 'package:flutter/material.dart';
import 'package:new_practo_app/login.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final List des = [
    "Video consult top doctors\nfrom the comfort of your\nhome",
    "Read patients' stories and\nbook doctor appointments",
    "Get upto 25% off on\nmedicines,health and\nwellness products",
    "1 Crore Indians connect\nwith doctor every year on\nPracto"
  ];
  final List image = [
    "assets/img1.png",
    "assets/img2.png",
    "assets/img3.png",
    "assets/img4.png"
  ];
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: des.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xff24bbf2),
                                  size: 20,
                                ),
                                Text(
                                  "practo",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Color(0xfffffdff),
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Color(0xff24bbf2),
                                  size: 20,
                                ),
                              ],
                            ),
                            Image.asset(
                              image[index],
                              scale: 2,
                            ),
                            Text(
                              des[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(color: Color(0xff28318c)),
                      height: size.height / 1.5,
                      width: size.width,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Let's get started! Enter your mobile\nnumber",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "  +91 ▼   ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black87),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: const Color.fromARGB(96, 71, 69, 69),
                            ),
                          ),
                          Text(
                            "   Mobile number  ",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ],
                      ),
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color.fromARGB(115, 82, 78, 78))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Trouble signing in?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
