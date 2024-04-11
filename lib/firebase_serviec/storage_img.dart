import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:final_project/views/sign_up.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
  File? file;
  var imagepicker = ImagePicker();
  String? lop;
  Future<String?> uploadImages(key) async {
    var imgepicker = await imagepicker.pickImage(source: ImageSource.gallery);
    if (imgepicker != null) {
      file = File(imgepicker.path);
      if (key == 'image') {
        saveImage('image', file!);
      } else if (key == 'image1') {
        saveImage('image1', file!);
      } else if (key == 'image2') {
        saveImage('image2', file!);
      }
    } else {
      showToastMessage('Please choose an image!');
    }
    return null;
  }

  takeImages(key) async {
    var camerimage = await imagepicker.pickImage(source: ImageSource.camera);
    if (camerimage != null) {
      file = File(camerimage.path);
      if (key == 'image') {
        saveImage('image', file!);
      } else if (key == 'image1') {
        saveImage('image1', file!);
      } else if (key == 'image2') {
        saveImage('image2', file!);
      }
    } else {
      showToastMessage('Please choose an image!');
    }
  }

  static Future<void> saveImage(String key, File imageFile) async {
    try {
      // Convert image file to bytes
      List<int> imageBytes = await imageFile.readAsBytes();

      // Convert bytes to base64-encoded string
      String base64Image = base64Encode(imageBytes);

      // Save base64-encoded string to storage
      await box.write(key, base64Image);
    } catch (e) {
      // Handle any errors
      log('Error saving image: $e');
    }
  }

  static dynamic getImage(String key) {
    try {
      if (key == 'image') {
        // Read base64-encoded string from storage
        String? base64Image = box.read(key);

        if (base64Image != null) {
          // Decode base64-encoded string to bytes
          List<int> imageBytes = base64Decode(base64Image);
          return imageBytes;
        }
      } else if (key == 'image1') {
        // Read base64-encoded string from storage
        String? base64Image1 = box.read(key);

        if (base64Image1 != null) {
          // Decode base64-encoded string to bytes
          List<int> imageBytes1 = base64Decode(base64Image1);
          return imageBytes1;
        }
      } else if (key == 'image2') {
        // Read base64-encoded string from storage
        String? base64Image2 = box.read(key);

        if (base64Image2 != null) {
          // Decode base64-encoded string to bytes
          List<int> imageBytes2 = base64Decode(base64Image2);
          return imageBytes2;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      // Handle any errors
      print('Error getting image: $e');
      return null;
    }
  }

  static void removeImage(String key) {
    // Remove image from storage
    box.remove(key);
  }
}
