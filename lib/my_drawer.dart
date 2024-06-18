import 'package:flutter/material.dart';
import 'package:new_practo_app/Abha.dart';
import 'package:new_practo_app/appoint.dart';
import 'package:pinput/pinput.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final List text = [
      "ABHA",
      "Appointments",
      "Test Bookings",
      "Orders",
      "Consultations",
      "My Doctors",
      "Medical Records",
      "Mi insurance Policy",
      "Reminder",
      "My Doctors",
      "Medical Records",
      "Mi insurance Policy",
      "Reminder"
    ];
    final List icon = [
      Icons.account_balance,
      Icons.event_note,
      Icons.assignment,
      Icons.shopping_cart,
      Icons.video_call,
      Icons.group,
      Icons.description,
      Icons.assignment,
      Icons.alarm,
      Icons.payment,
      Icons.description,
      Icons.assignment,
      Icons.alarm,
      Icons.payment,
    ];
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  "assets/per.png",
                  scale: 5,
                ),
                title: Text(
                  "Alka",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "view and edit profile",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                    Text("18% completed"),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
              Divider(),
              ListTile(
                subtitle: Text(
                  "Health plan for your family",
                  style: TextStyle(fontSize: 12),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Practo",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 27,
                      width: 50,
                      child: Center(
                          child: Text(
                        "plus",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              Divider(thickness: 10, color: Color(0xffefefef)),

              /////////

              ListView.builder(
                shrinkWrap: true,
                itemCount: text.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Abha()),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Appoint()),
                          );
                          break;

                        default:
                          break;
                      }
                    },
                    title: Text(text[index]),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    leading: Icon(
                      icon[index],
                      color: Color(0xff0a3c93),
                    ),
                  );
                },
              )

              //////////
            ],
          ),
        ),
      ),
    );
  }
}
