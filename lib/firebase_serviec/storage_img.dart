import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
  File? file;
  var imagepicker = ImagePicker();
  String? lop;
  Future<String?> uploadImages() async {
    var imgepicker = await imagepicker.pickImage(source: ImageSource.gallery);
    String? url = lop;
    if (imgepicker != null) {
      file = File(imgepicker.path);
      var refStorage = FirebaseStorage.instance.ref("images/$file");
      await refStorage.putFile(file!);
      var link = await refStorage.getDownloadURL();
      final bytes = await refStorage.getData();
      url = link;
    } else {
                  showToastMessage('Please choose an image!');

    }
  }

  takeImages() async {
    var camerimage = await imagepicker.pickImage(source: ImageSource.camera);
    if (camerimage != null) {
      file = File(camerimage.path);
      var refStorage = FirebaseStorage.instance.ref("images/");
      await refStorage.putFile(file!);
      var link = await refStorage.getDownloadURL();
      final bytes = await refStorage.getData();
    } else {
       showToastMessage('Please choose an image!');
    }
  }
}
