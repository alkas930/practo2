import 'package:flutter/material.dart';

class Abha extends StatefulWidget {
  const Abha({Key? key}) : super(key: key);

  @override
  State<Abha> createState() => _AbhaState();
}

class _AbhaState extends State<Abha> {
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
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
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
        ],
      ),
    );
  }
}
