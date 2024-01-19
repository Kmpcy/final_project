import 'package:final_project/constans/appcolor.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    CustomButton({ required this.text,this.onTap});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap,
      child: Container(
        child: Center(child: Text(text, style: TextStyle(fontSize: 22,color:Colors.white))),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color:AppColor.greenColor),
        height: 50,
       width:100,
      ),
    );
  }
}