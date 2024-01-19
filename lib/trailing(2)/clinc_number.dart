
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:final_project/constans/appcolor.dart';


import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class ClincNumber extends StatelessWidget {
  const ClincNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Text(S.of(context).ClincNumber,
                style: TextStyle(
                    color: AppColor.greenColor, fontSize: 16)),
            Expanded(child: IntlPhoneField())
          ],
        ));
  }
}