
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';


import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';
 

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text(S.of(context).Add))
        ],
      ),
    );
  }
}
