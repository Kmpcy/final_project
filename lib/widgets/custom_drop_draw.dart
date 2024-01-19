import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

class MyDropdown2 extends StatefulWidget {
   List<String> listItems = [];

  MyDropdown2(  {required this.listItems,super.key});

  @override
  _MyDropdown2State createState() => _MyDropdown2State();
}

class _MyDropdown2State extends State<MyDropdown2> {
  String selectedItem = 'Select Your Specialtiy';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      icon: Icon(Icons.arrow_downward), // Arrow-down icon
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color:AppColor.greenColor),
      onChanged: ( newValue) {
        setState(() {
          selectedItem = newValue!;
        });
      },
      items:widget.listItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}