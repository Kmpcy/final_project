import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/firebase_serviec/storage_img.dart';
import 'package:flutter/material.dart';

class MyDropdown2 extends StatefulWidget {
  List<String> listItems = [];
  String selecteditem;
  final String image;
  MyDropdown2(
      {required this.selecteditem,
      required this.listItems,
      required this.image,
      super.key});

  @override
  State<MyDropdown2> createState() => _MyDropdown2State();
}

class _MyDropdown2State extends State<MyDropdown2> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selecteditem,
      icon: const Icon(Icons.arrow_downward), // Arrow-down icon
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: AppColor.greenColor),
      onChanged: (newValue) {
        setState(() {
          widget.selecteditem = newValue!;
          if (widget.selecteditem == 'Upload Images') {
            if (widget.image == 'image') {
              Storage().uploadImages('image');
            } else if (widget.image == 'image1') {
              Storage().uploadImages('image1');
            } else if (widget.image == 'image2') {
              Storage().uploadImages('image2');
            }
          } else if (widget.selecteditem == 'Take Images') {
            if (widget.image == 'image') {
              Storage().takeImages('image');
            } else if (widget.image == 'image1') {
              Storage().takeImages('image1');
            } else if (widget.image == 'image2') {
              Storage().takeImages('image2');
            }
          } else {
            Storage.removeImage('image');
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
