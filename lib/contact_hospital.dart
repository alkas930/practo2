import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ContactHospital extends StatefulWidget {
  final String images;
  final String name;
  final String like;
  final String story;
  final String des;

  const ContactHospital({
    Key? key,
    required this.images,
    required this.name,
    required this.like,
    required this.story,
    required this.des,
  }) : super(key: key);

  @override
  State<ContactHospital> createState() => _ContactHospitalState();
}

class _ContactHospitalState extends State<ContactHospital> {
  bool ontapped = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200, // Height of the app bar when expanded
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.images,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "General Physician",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      // Your body content here
                      // Replace with your existing body content
                      Text(
                        "Your existing body content goes here...",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Center(
                  child: Text(
                    "Book Clinic Visit",
                    style: TextStyle(
                      color: Color(0xff1a9fda),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 40,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff1a9fda), width: 1.5),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    "Call Clinic",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 40,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  color: Color(0xff1a9fda),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
