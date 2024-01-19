
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/widgets/custom_text_field.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';
 
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
          hintText: "  Enter your Full Name here....",
          obscure: false,
          onSubmitted: (value) {
            print(value);
          },
        ),
      ],
    );
  }
}