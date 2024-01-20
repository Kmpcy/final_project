import 'package:final_project/widgets/custom_drop_draw.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/drop_draw.dart';

import 'package:final_project/widgets/custom_drop_draw.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class YourID extends StatelessWidget {
  const YourID({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(S.of(context).YourID,
              style: TextStyle(color: AppColor.greenColor, fontSize: 20)),
          SizedBox(width: 44),
          MyDropdown(listItems: [
            "Passport",
            "ID",
          ], selecteditem: "Passport"),
          Expanded(child: CustomFormTextField(validator: (value) {
            if (value == 'ID') {
              
              if (value == null || value.isEmpty) {
                return 'Please enter an ID';
              }
              if (int.tryParse(value) == null) {
                return 'Invalid ID. Please enter only numbers.';
              }
            } else {
             
              if (value == null || value.isEmpty) {
                return 'Please enter a Passport';
              }{if (!value.contains(RegExp(r'^[a-zA-Z]+$'))){
 return "Please make sure ";
    }}
            }
          }))
        ],
      ),
    );
  }
}
