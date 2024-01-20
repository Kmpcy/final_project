import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:final_project/widgets/custom_drop_draw.dart';
import 'package:flutter/material.dart';

class ScientificDegree extends StatelessWidget {
  const ScientificDegree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(S.of(context).ScientificDegree,
              style: TextStyle(color: AppColor.greenColor, fontSize: 20)),
          SizedBox(width: 28),
          Expanded(
              child: MyDropdown1(
            listItems: ['Select Your ScientificDegree', "ScientificDegree 2"],
            selecteditem: 'Select Your ScientificDegree',
          ))
        ],
      ),
    );
  }
}
