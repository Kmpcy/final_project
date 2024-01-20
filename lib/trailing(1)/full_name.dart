import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class FullName extends StatelessWidget {
  const FullName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).FullName,
            style: TextStyle(
                backgroundColor: Colors.white,
                color: AppColor.greenColor,
                fontSize: 20)),
        CustomFormTextField(
          hintText: S.of(context).hint,
          obscure: false,
          onSubmitted: (value) {
            print(value);
          } ,validator:(data) {
    if (data!.isEmpty) {
    return "Field is required";
    }
    if (!data.contains(RegExp(r'^[a-zA-Z]+$'))){
 return "Please wrtie your name ";
    }
    }, 
        ),
      ],
    );
  }
}
