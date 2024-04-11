import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

TextEditingController personalAddressController = TextEditingController();

class PersonalAddress extends StatelessWidget {
  const PersonalAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Text(
            S.of(context).PersonalAddress,
            style: const TextStyle(color: AppColor.greenColor, fontSize: 20),
          ),
          Expanded(
            child: CustomFormTextField(
              controller: personalAddressController,
              validator: (data) {
                if (data!.isEmpty) {
                  return "Field is required";
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
