
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';
 
class Condtition_byVideo extends StatelessWidget {
  const Condtition_byVideo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Text(
                 S.of(context).Describeyourconditionbyvideo,
                style: TextStyle(
                    fontSize: 18, color: Colors.black)),
            SizedBox(width: 88),
            IconButton(
              color: AppColor.greenColor,iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.upload),
            ),
            IconButton(
              color: AppColor.greenColor,iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.videocam),
            )
          ],
        ));
  }
}
