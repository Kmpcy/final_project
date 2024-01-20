import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:final_project/generated/l10n.dart';
import "package:final_project/firebase_serviec/storage_vid.dart";

class Condtition_byVideo extends StatelessWidget {
  Condtition_byVideo({
    super.key,
  });
  String? videoUrl;
  File? file;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Text(S.of(context).Describeyourconditionbyvideo,
                style: TextStyle(fontSize: 18, color: Colors.black)),
            SizedBox(width: 88),
            IconButton(
              color: AppColor.greenColor,
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.upload),
            ),
            IconButton(
              color: AppColor.greenColor,
              iconSize: 30,
              onPressed: pickVideo,
              icon: Icon(Icons.videocam),
            )
          ],
        ));
  }

  Future<void> pickVideo() async {
    try {
      videoUrl = await pickdVideo();

      file = File(videoUrl!);
      final storageRef = FirebaseStorage.instance.ref("vid/$videoUrl");
      await storageRef.putFile(file!);
    } on Exception catch (e) {
      print("error in uploading $e");
    }
  }
}
