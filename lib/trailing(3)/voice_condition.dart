
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';



import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class Condition_byVoice extends StatelessWidget {
  const Condition_byVoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Text(
                S.of(context).Describeyourconditionbyvoice,
                style: TextStyle(
                    fontSize: 18, color: Colors.black)),
            SizedBox(width: 52),
            IconButton(
              color: AppColor.greenColor,
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.upload),
            ),
            IconButton(
              color: AppColor.greenColor,iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.mic),
            )
          ],
        ));
  }
}
