
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/widgets/custom_text_field.dart';


import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class password extends StatelessWidget {
  const password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.white,
                  child: Row(children: [
                    Text(S.of(context).Password,
                          style: TextStyle(
    color: AppColor.greenColor, fontSize: 20)),
    Expanded(child: CustomFormTextField())
    ],));
  }
}