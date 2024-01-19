
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';


class UploadLincense extends StatelessWidget {
  const UploadLincense({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(S.of(context).UploadLicense,
              style: TextStyle(
                  fontSize: 18, color: AppColor.greenColor)),
          SizedBox(width: 25),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.upload)),
          SizedBox(width: 70),
          Text("Uplaod a photo",
              style: TextStyle(
                  fontSize: 16, color: AppColor.greenColor))
        ],
      ),
    );
  }
}