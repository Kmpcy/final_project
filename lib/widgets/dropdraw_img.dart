import 'package:final_project/firebase_serviec/storage_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

class MyDropdown2 extends StatefulWidget {
  List<String> listItems = [];
  String selecteditem;
  MyDropdown2({required this.selecteditem, required this.listItems, super.key});

  @override
  _MyDropdown2State createState() => _MyDropdown2State();
}

class _MyDropdown2State extends State<MyDropdown2> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selecteditem,
      icon: Icon(Icons.arrow_downward), // Arrow-down icon
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: AppColor.greenColor),
      onChanged:  (newValue)  {
        setState(()     {widget.selecteditem = newValue!;
          if (widget.selecteditem == 'Upload Images')      {
                       Storage().uploadImages();
          } else{
                 Storage().takeImages();
          }
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
