import 'dart:developer';

import 'package:final_project/constans/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../views/sign_up.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  bool isExpanded = true;
  final List<Widget> childList;

  CustomListTile(
      {required this.title,
      required this.isExpanded,
      required this.childList,
      super.key});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          log(value.toString());
          setState(() {
            isExpanded = value;
          });
        },
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 17.sp),
        ),
        backgroundColor: AppColor.greenColor,
        collapsedBackgroundColor: AppColor.greenColor,
        trailing: isExpanded == true
            ? Icon(
                Icons.keyboard_arrow_down,
                size: 30.sp,
                color: Colors.white,
              )
            : Icon(
                Icons.keyboard_arrow_up,
                size: 30.sp,
                color: Colors.white,
              ),
        children: widget.childList,
      ),
    );
  }
}
