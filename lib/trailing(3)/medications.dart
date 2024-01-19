import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';



import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';

class Medications extends StatelessWidget {
  const Medications({
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
            padding: const EdgeInsets.only(left: 85),
            child: IconButton(color:AppColor.greenColor,
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline)),
          ),
        ],
      ),
    );
  }
}
 
