import 'dart:io';

import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Condition_byVoice extends StatefulWidget {
  Condition_byVoice({
    super.key,
  });

  @override
  State<Condition_byVoice> createState() => _Condition_byVoiceState();
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

class _Condition_byVoiceState extends State<Condition_byVoice> {
  @override
  late Record audioRecord;
  bool isRecording = false;
  String audioPath = "";
  File? file;
  void initState() {
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
  if (await audioRecord.hasPermission()) {
    await audioRecord.start();
 
    setState(() {
      isRecording = true;
    });
  }
} on Exception catch (e) {
  print("Error in start rec $e");
}
  }

  Future<void> stopRecording() async {
    try {
  String? path = await audioRecord.stop();
  setState(() {
    isRecording = false;
    audioPath = path!;
          
file = File(audioPath);
                final storageRef = FirebaseStorage.instance.ref("audio/$audioPath");
                 storageRef.putFile(file!);
  });
} on Exception catch (e) {
    print("Error in stop rec $e");
}
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Text(S.of(context).Describeyourconditionbyvoice,
                style: TextStyle(fontSize: 18, color: Colors.black)),
            SizedBox(width: 0),
            IconButton(
              color: AppColor.greenColor,
              iconSize: 30,
              onPressed: ()async {






              },
              icon: Icon(Icons.upload),
            ),
            Container(
              width: 124,
              height: 40,
              child: ElevatedButton.icon(
                  onPressed: isRecording ? stopRecording : startRecording,
                  icon: Icon(Icons.mic),
                  label: isRecording
                      ? const Text("Stop Recording")
                      : const Text("Start Recording")),
            ),
          ],
        ));
  }
}
