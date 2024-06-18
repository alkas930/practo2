import 'package:flutter/material.dart';
import 'package:new_practo_app/contact_hospital.dart';

class Appoint extends StatefulWidget {
  const Appoint({super.key});

  @override
  State<Appoint> createState() => _AppointState();
}

class _AppointState extends State<Appoint> {
  List<String> itemmenu = [
    'banglore',
    'chandigarh',
    'panchkula',
    'ambala',
    'mohali',
  ];
  String _selectedOption = 'ambala';
  @override
  Widget build(BuildContext context) {
    final List headings = [
      'now or later  ',
      'Video Consult',
      'Plus',
      'sort/Filters'
    ];

    final List images = [
      "assets/d1.jpg",
      "assets/d2.jpg",
      "assets/d3.jpg",
      "assets/d4.jpg",
      "assets/d1.jpg",
      "assets/d2.jpg",
      "assets/d3.jpg",
      "assets/d4.jpg"
    ];
    final List name = [
      "Dr. Tejas suresh Rao",
      "Dr. Ravishankar reddy ",
      "Dr Pardeep kasyap",
      "Dr Arvind G.M",
      "Dr. Tejas suresh Rao",
      "Dr. Ravishankar reddy ",
      "Dr Pardeep kasyap",
      "Dr Arvind G.M",
    ];
    final List likes = [
      "86%",
      "49%",
      "89%",
      "92%",
      "86%",
      "49%",
      "89%",
      "92%",
    ];
    final List story = [
      "10 patient story",
      "15 patient story",
      "34 patient story",
      "5 patient story",
      "10 patient story",
      "15 patient story",
      "34 patient story",
      "5 patient story",
    ];
    final List des = [
      "Specail interest in Diabetology",
      "31 years experience overall ",
      "21 years experience overall ",
      "4 years experience overall",
      "pecail interest in Diabetology",
      "31 years experience overall ",
      "21 years experience overall ",
      "4 years experience overall",
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff28318c),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Find your health concern",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(5),
              dropdownColor: Color(0xff28318c),
              style: TextStyle(color: Colors.white),
              focusColor: Color(0xff28318c),
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white,
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!; // Update selected option
                });
              },
              items: itemmenu.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "search hare",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: headings.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                              color: Color.fromARGB(255, 126, 124, 124))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Center(
                          child: Text(
                            headings[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Result offering ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Prime ",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "benefits ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.error_outline),
                      ],
                    )
                  ],
                ),
              ),
              color: Color(0xfff2f1f9),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      if (index == 2) {
                        // Show the submit button after the second index
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle submit button click
                            },
                            child: Text('Submit'),
                          ),
                        );
                      } else {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                        maxRadius: 40,
                                        backgroundImage:
                                            AssetImage(images[index])),
                                    // SizedBox(
                                    //   width: 15,
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              name[index],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(Icons.check_circle_outline),
                                          ],
                                        ),
                                        Text("General Physician"),
                                        Text(des[index]),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.thumb_up,
                                              color: Colors.green,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              likes[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.message,
                                              color: Colors.green,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              story[index],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Divider(
                                  color: Color(0xfff4f4f4),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "sesdripuram",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 10,
                                        ),
                                        Text("Apollo hospitals")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "~ ₹ 740",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("  Consulatation fees")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "NEXT AVAILABLE AT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: 13),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.home_outlined,
                                          size: 17,
                                        ),
                                        Text("10 AM,tomorrow")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            (MaterialPageRoute(
                                                builder: (context) =>
                                                    ContactHospital(
                                                      des: des[index],
                                                      images: images[index],
                                                      like: likes[index],
                                                      name: name[index],
                                                      story: story[index],
                                                    ))));
                                      },
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            "Contact Hospital",
                                            style: TextStyle(
                                                color: Color(0xff1a9fda),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        height: 40,
                                        width: size.width / 2.2,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff1a9fda),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: Center(
                                          child: Text(
                                            "Book Clinic Visit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        height: 40,
                                        width: size.width / 2.2,
                                        decoration: BoxDecoration(
                                          color: Color(0xff1a9fda),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ))
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xfff1f1f1),
                                thickness: 8,
                              )
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
