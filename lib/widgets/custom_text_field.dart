import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.obscure = false, this.hintText, this.onSubmitted});
  String? hintText;
  Function(String)? onSubmitted;
  bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.white,
      width: 260,
      child: TextFormField(
          obscureText: obscure!,
          validator: (data) {
            if (data!.isEmpty) {
              return "Field is required";
            }
          },
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            ),
          ),
          // تحديد الارتفاع هنا
          style: TextStyle(height: 1,color: Colors.black)),
    );
  }
}
