import 'package:flutter/material.dart';
import 'package:new_practo_app/appoint.dart';
import 'package:new_practo_app/my_drawer.dart';
import 'package:new_practo_app/splash.dart';
import 'package:pinput/pinput.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> itemmenu = [
    'banglore',
    'chandigarh',
    'panchkula',
    'ambala',
    'mohali',
  ];
  String _selectedOption = 'ambala'; // Initial value
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List images = [
      "assets/hair-removebg-preview.png",
      "assets/joint-removebg-preview.png",
      "assets/diebitiz-removebg-preview.png",
      "assets/50s-removebg-preview.png"
    ];
    final List text = ["hair & scalp", "joint pain", "Diabetes", "more"];
    final List text2 = [
      "hair & scalp",
      "joint pain",
      "Diabetes",
      "more",
      "hair & scalp",
      "joint pain",
      "Diabetes",
      "more"
    ];
    final List image = [
      "assets/b2.jpg",
      "assets/b4.jpeg",
      "assets/b2.jpg",
      "assets/b4.jpeg",
    ];

    final List images3 = [
      "assets/b2.jpg",
      "assets/hair-removebg-preview.png",
      "assets/joint-removebg-preview.png",
      "assets/50s-removebg-preview.png",
      "assets/b4.jpeg",
      "assets/b2.jpg",
      "assets/b4.jpeg",
      "assets/diebitiz-removebg-preview.png",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Color(0xffdfdfe9),
            ),
          );
        }),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 17,
                      color: Color.fromARGB(255, 72, 33, 243),
                    ),
                    // Text(
                    //   "Bangalore",
                    //   style:
                    //       TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // ),
                    // Icon(Icons.arrow_drop_down),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(5),
                      dropdownColor: const Color.fromARGB(255, 247, 245, 245),
                      style: TextStyle(color: Colors.black),
                      iconSize: 27,
                      alignment: Alignment.center,
                      focusColor: const Color.fromARGB(255, 247, 246, 246),
                      value: _selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!; // Update selected option
                        });
                      },
                      items: itemmenu
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Splashscreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffe6f5fc),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.note_add,
                              color: Colors.blue,
                            ),
                            Text(
                              "ABHA",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.wallet),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 40,
                    width: size.width / 1.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xfff1f0f6),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search here",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Appoint()));
                        },
                        child: Container(
                          height: 290,
                          width: size.width / 2.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xfff1f0f6),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: Color(0xffb0cfec),
                                ),
                                height: 150,
                                width: size.width / 2.3,
                                child: Image.asset(
                                  "assets/doctor-removebg-preview.png",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Book Appointment",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "Confirmed appointments",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 290,
                        width: size.width / 2.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xfff1f0f6),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Color(0xff7fbdca),
                              ),
                              height: 150,
                              width: size.width / 2.3,
                              child: Image.asset(
                                "assets/doctor1-removebg-preview.png",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Instant Video Con...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "Connect within 60 secs",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xfff4f4fe),
                        radius: 15,
                        child: Icon(Icons.star_border),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Featured services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xff28318c),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Affordable Procedures by ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  "Expert Doctors ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: text.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      const Color(0xffd1e4eb),
                                                ),
                                                height: 60,
                                                width: 60,
                                                child: Image.asset(
                                                  images[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          text[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "All insurances accepted\n& No Cost EMI available",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff19a0da),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 30,
                                width: 130,
                                child: const Center(
                                  child: Text(
                                    "Get Cost Estimate",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 240,
                            width: 150,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: Color.fromARGB(255, 224, 220, 240),
                              //     width: 1,
                              //     ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              image[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  thickness: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xfff4f4fe),
                        radius: 15,
                        child: Icon(Icons.video_call),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Not feeling too well?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Treat common symptoms with top specislities",
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images3.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                foregroundImage: AssetImage(images3[index]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(text2[index]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 40,
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "View All Symptoms",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 350,
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xff28318c)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 18),
                                  child: Image.asset(
                                    "assets/per-removebg-preview.png",
                                    color: Colors.white,
                                    scale: 8,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Best offers",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Explore deals, offers,health updates and\nmore",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 220,
                              child: ListView.builder(
                                itemCount: images.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 130,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Image.asset(
                                        image[index],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
