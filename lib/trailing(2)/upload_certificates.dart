
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:final_project/widgets/custom_drop_draw.dart';
import 'package:final_project/widgets/dropdraw_img.dart';
import 'package:flutter/material.dart';

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
          SizedBox(width: 66),
          Text("Uplaod a photo",
              style: TextStyle(
                  fontSize: 16, color: AppColor.greenColor))
        ],
      ),
    );
  }
}