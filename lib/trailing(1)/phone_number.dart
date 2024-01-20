import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:final_project/constans/appcolor.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class phoneNumber extends StatelessWidget {
  phoneNumber({
    super.key,
  });
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Text(S.of(context).Mobile,
                style: TextStyle(color: AppColor.greenColor, fontSize: 16)),
            Expanded(
                child: IntlPhoneField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (number) {
                    
                   if (number!.toString().isEmpty) {
                        return 'Please enter a phone number';
                      } else if (number.toString().length != 11 || number!.toString().startsWith('0')) {
                        return 'Invalid phone number. It must be 11 digits starting with 0.';
                      }
                      return null;
                    }))
          ],
        ));
  }
}
