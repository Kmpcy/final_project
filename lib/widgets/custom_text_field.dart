import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      this.obscure = false,
      this.hintText,
      this.onSubmitted,
      this.validator,
      required this.controller});
  String? hintText;
  Function(String)? onSubmitted;
  String? Function(String?)? validator;
  bool? obscure;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.white,
      width: 260,
      child: TextFormField(
        style: const TextStyle(fontSize: 16, height: 2),
        controller: controller,
        obscureText: obscure!,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent),
          ),
        ),
        // تحديد الارتفاع هنا
        // style: TextStyle(height: 0, color: Colors.black)),
      ),
    );
  }
}
