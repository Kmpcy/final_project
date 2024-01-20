import 'package:final_project/constans/appcolor.dart';
import 'package:flutter/material.dart';

class MyDropdown1 extends StatefulWidget {
  List<String> listItems = [];
  String selecteditem;
  MyDropdown1({required this.selecteditem, required this.listItems, super.key});

  @override
  _MyDropdown1State createState() => _MyDropdown1State();
}

class _MyDropdown1State extends State<MyDropdown1> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selecteditem,
      icon: Icon(Icons.arrow_downward), // Arrow-down icon
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: AppColor.greenColor),
      onChanged: (newValue) {
        setState(() {
          widget.selecteditem = newValue!;
        });
      },
      items: widget.listItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
