import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
  File? file;
  var imagepicker = ImagePicker();

  uploadImages() async {
    var galleryimage =  await imagepicker.pickImage(source: ImageSource.gallery);
     var camerimage = await  imagepicker.pickImage(source: ImageSource.camera);
  }
}
