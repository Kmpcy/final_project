
import 'package:final_project/widgets/drop_draw.dart';
import 'package:final_project/widgets/dropdraw_img.dart';
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
           PopupMenuButton(
                                icon: Icon(Icons.upload,
                                    color: AppColor.greenColor),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: MyDropdown2(listItems: [
                                        'Upload Images',
                                        "Take Images"
                                      ], selecteditem: 'Upload Images'))
                                    ]),
         
          SizedBox(width: 70),
          Text("Uplaod a photo",
              style: TextStyle(
                  fontSize: 16, color: AppColor.greenColor))
        ],
      ),
    );
  }
}