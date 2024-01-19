
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';


class City extends StatelessWidget {
  const City({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(S.of(context).City,
    style: TextStyle(
        color: AppColor.greenColor, fontSize: 20)),
          SizedBox(width: 44),
       Expanded(child: Container(child: CSCPicker(layout:Layout.vertical,
        onCityChanged: ( value) {
           
        },
))),
         
        ],
      ),
    );
  }
}
