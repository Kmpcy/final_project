
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/drop_draw.dart';


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
              style: TextStyle(
                  color: AppColor.greenColor, fontSize: 20)),
          SizedBox(width: 44),
          MyDropdown(listItems: ["Passport", "ID"]),
          Expanded(child: CustomFormTextField()),
        ],
      ),
    );
  }
}