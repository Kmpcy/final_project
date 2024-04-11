import 'package:final_project/constans/appcolor.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColor.greenColor),
        height: 50,
        width: 100,
        child: Center(
            child: Text(text,
                style: const TextStyle(fontSize: 22, color: Colors.white))),
      ),
    );
  }
}
