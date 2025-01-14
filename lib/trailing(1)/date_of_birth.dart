import 'dart:developer';

import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DateOfBirth extends StatelessWidget {
  const DateOfBirth({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(
            S.of(context).DateofBirth,
            style: const TextStyle(
              color: AppColor.greenColor,
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2000, 3, 5),
                  maxTime: DateTime(2024, 1, 21), onChanged: (date) {
                log('change $date');
              }, onConfirm: (date) {
                log('confirm $date');
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: const Text(
              'show date time picker ',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
