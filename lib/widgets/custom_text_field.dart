import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {this.obscure = false, this.hintText, this.onSubmitted, this.validator});
  String? hintText;
  Function(String)? onSubmitted;
  String? Function(String?)? validator;
  bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Container(  height:75,
      color: Colors.white,
      width: 260,
      child: TextFormField(
          style: TextStyle(fontSize: 16, height: 2),
          obscureText: obscure!,
          validator: validator,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            ),
          ),
          // تحديد الارتفاع هنا
         // style: TextStyle(height: 0, color: Colors.black)),
     ) );
  }
}
