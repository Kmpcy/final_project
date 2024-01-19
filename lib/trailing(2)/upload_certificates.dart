
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

class UploadCertificates extends StatelessWidget {
  const UploadCertificates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(S.of(context).UploadCertificates,
              style: TextStyle(
                  fontSize: 18, color: AppColor.greenColor)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.upload)),
          SizedBox(width: 66),
          Text("Uplaod a photo",
              style: TextStyle(
                  fontSize: 16, color: AppColor.greenColor))
        ],
      ),
    );
  }
}