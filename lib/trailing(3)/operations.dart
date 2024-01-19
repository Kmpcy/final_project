
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class Operations extends StatelessWidget {
  const Operations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text( S.of(context).Pleaseaddmedicationsifany,
              style:
                  TextStyle(fontSize: 18, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: IconButton(color:AppColor.greenColor,
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline)),
          ),
        ],
      ),
    );
  }
}