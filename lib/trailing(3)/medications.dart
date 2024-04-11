import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

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
          Text(S.of(context).Pleaseaddmedicationsifany,
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          const Spacer(),
          IconButton(
              color: AppColor.greenColor,
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline)),
        ],
      ),
    );
  }
}
