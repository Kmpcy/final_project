import 'package:image_picker/image_picker.dart';

pickdVideo() async {
  final picker = ImagePicker();

  XFile? videoFile;

  try {
  videoFile = await picker.pickVideo(source: ImageSource.camera);
  return videoFile!.path;
} on Exception catch (e) {
  print("Error $e");
}
}
