import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/firebase_serviec/storage_vid.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:final_project/trailing(1)/password_confirm.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:final_project/widgets/custom_drop_draw.dart';
import 'package:final_project/widgets/custom_listTile.dart';
import 'package:final_project/widgets/custom_text_field.dart';
import 'package:final_project/widgets/drop_draw.dart';
import 'package:final_project/widgets/dropdraw_img.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:record/record.dart';
import 'package:sizer/sizer.dart';

bool language = false;
bool isExpanded = true;
String? gender;
String countryValue = "";

late String? stateValue;

late String? cityValue;
String? videoUrl;
File? file;

String address = "";
TextEditingController phoneNumberController = TextEditingController();

late Record audioRecord;
bool isRecording = false;
String audioPath = "";
File? audioFile;
final _formKey = GlobalKey<FormState>();
  late String _password ="";
  late String _confirmPassword="";
class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Row(children: [
              SizedBox(
                  height: 25.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 3.w),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              language = !language;

                              setState(() {});

                              Navigator.pushNamed(context, '/setting');
                            },
                            icon: Icon(
                              Icons.settings,
                              size: 20.sp,
                            )),
                        Text(
                          "Language",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        language == false
                            ? const SizedBox()
                            : SizedBox(
                                height: 10.h,
                                // width: 20.w,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  topLeft: Radius.circular(15)),
                                              side: BorderSide(
                                                  color: Colors.black87),
                                            ),
                                            backgroundColor: Colors.white,
                                            fixedSize: Size.fromWidth(20.w)),
                                        child: Text(
                                          'English',
                                          style: TextStyle(
                                            color: AppColor
                                                .greenColor, // Text color
                                          ),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 0,),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15),
                                                bottomLeft:
                                                    Radius.circular(15)),
                                          ),
                                          side: const BorderSide(
                                            color: Colors.black87,
                                          ),
                                          backgroundColor: Colors.white,
                                          fixedSize: Size.fromWidth(20.w)),
                                      child: const Text(
                                        'العربيه',
                                        style: TextStyle(
                                          color:
                                              AppColor.greenColor, // Text color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  )),
              SizedBox(
                width: 11.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                          radius: 40.sp,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=826&t=st=1705829277~exp=1705829877~hmac=d11d921de8f4a56291dc3fe0a36bd2be935697b6652fc60eecdc6e967dcf1155")),
                    ),
                    Positioned(
                        right: -9,
                        bottom: -7,
                        child: Row(
                          children: [
                            PopupMenuButton(
                                icon: Icon(Icons.camera_alt,
                                    color: AppColor.greenColor),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: MyDropdown2(listItems: [
                                        'Upload Images',
                                        "Take Images"
                                      ], selecteditem: 'Upload Images'))
                                    ]),
                          ],
                        )),
                  ],
                ),
              )
            ]),
            CustomListTile(
              title: S.of(context).PersonalInfo,
              isExpanded: isExpanded,
              childList: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(S.of(context).FullName,
                              style: TextStyle(
                                  backgroundColor: Colors.white,
                                  color: AppColor.greenColor,
                                  fontSize: 20)),
                          CustomFormTextField(
                            hintText: S.of(context).hint,
                            obscure: false,
                            onSubmitted: (value) {
                              print(value);
                            },
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "Field is required";
                              }
                              if (!data.contains(RegExp(r'^[a-zA-Z]+$'))) {
                                return "Please wrtie your name ";
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(S.of(context).YourID,
                          style: TextStyle(
                              color: AppColor.greenColor, fontSize: 20)),
                      SizedBox(width: 44),
                      MyDropdown(listItems: [
                        S.of(context).Passport,
                        S.of(context).ID,
                      ], selecteditem: S.of(context).Passport),
                      Expanded(child: CustomFormTextField(validator: (value) {
                        if (value == 'ID') {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an ID';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Invalid ID. Please enter only numbers.';
                          }
                        } else {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Passport';
                          }
                          {
                            if (!value.contains(RegExp(r'^[a-zA-Z]+$'))) {
                              return "Please make sure ";
                            }
                          }
                        }
                      }))
                    ],
                  ),
                ),

                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(S.of(context).Gender,
                          style: TextStyle(
                              color: AppColor.greenColor, fontSize: 20)),
                      Expanded(
                          child: RadioListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Icon(Icons.male_sharp),
                              secondary: Text(S.of(context).Male,
                                  style: TextStyle(
                                      color: AppColor.greenColor,
                                      fontSize: 17)),
                              value: S.of(context).Male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              })),
                      SizedBox(width: 45),
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Icon(Icons.female_sharp),
                            secondary: Text(S.of(context).Female,
                                style: TextStyle(
                                    color: AppColor.greenColor, fontSize: 17)),
                            value: S.of(context).Female,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(S.of(context).DateofBirth,
                            style: TextStyle(
                                color: AppColor.greenColor, fontSize: 20)),
                        TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2000, 3, 5),
                                  maxTime: DateTime(2024, 1, 21),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Text(
                              'show date time picker ',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(S.of(context).PersonalAddress,
                            style: TextStyle(
                                color: AppColor.greenColor, fontSize: 20)),
                        Expanded(child: CustomFormTextField())
                      ],
                    )),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(S.of(context).City,
                          style: TextStyle(
                              color: AppColor.greenColor, fontSize: 20)),
                      SizedBox(width: 44),
                      Expanded(
                          child: Container(
                        child: Center(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 130,
                              child: ListView(
                                children: [
                                  CSCPicker(
                                    showStates: true,
                                    showCities: true,
                                    flagState:
                                        CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1)),
                                    disabledDropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.grey.shade300,
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1)),
                                    selectedItemStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    dropdownHeadingStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    dropdownItemStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    dropdownDialogRadius: 10.0,
                                    searchBarRadius: 10.0,
                                    onCountryChanged: (value) {
                                      setState(() {
                                        countryValue = value;
                                      });
                                    },
                                    onStateChanged: (value) {
                                      setState(() {
                                        stateValue = value;
                                      });
                                    },
                                    onCityChanged: (value) {
                                      setState(() {
                                        cityValue = value;
                                      });
                                    },
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          address =
                                              "$cityValue, $stateValue, $countryValue";
                                        });
                                      },
                                      child: Text("")),
                                  Text(address)
                                ],
                              )),
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(S.of(context).Mobile,
                            style: TextStyle(
                                color: AppColor.greenColor, fontSize: 16)),
                        Expanded(
                            child: IntlPhoneField(
                                controller: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (number) {
                                  if (number!.toString().isEmpty) {
                                    return 'Please enter a phone number';
                                  } else if (number.toString().length != 11 ||
                                      number!.toString().startsWith('0')) {
                                    return 'Invalid phone number. It must be 11 digits starting with 0.';
                                  }
                                  return null;
                                }))
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(S.of(context).Email,
                            style: TextStyle(
                                color: AppColor.greenColor, fontSize: 20)),
                        Expanded(child: CustomFormTextField(validator: (data) {
                          if (data!.isEmpty) {
                            return "Field is required";
                          }
                        }))
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(S.of(context).Password,
                            style: TextStyle(
                                color: AppColor.greenColor, fontSize: 20)),
                        Expanded(
                            child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                           
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          // Additional validation for mixed characters
                          if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter, lowercase letter, digit, and special character';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),)
                      ],
                    )),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(S.of(context).ConfirmPassword,
                            style: TextStyle(
                                color: AppColor.greenColor, fontSize: 20)),
                        Expanded(
                            child: TextFormField(
                        
                        obscureText: true,
                        decoration: InputDecoration(
                         
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password again';
                          }
                          if (value != _password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword = value!;
                        },
                      ),)
                      ],
                    )),

                //start here
              ],
            ),
            CustomListTile(
                title: S.of(context).WorkInfo,
                isExpanded: isExpanded,
                childList: [
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).MainSpeciality,
                                style: TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            SizedBox(width: 44),
                            Expanded(
                                child: MyDropdown1(
                              listItems: [
                                S.of(context).selectyourspecialty,
                                "Speaciality2"
                              ],
                              selecteditem: S.of(context).selectyourspecialty,
                            ))
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).subspecialty,
                                style: TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            SizedBox(width: 66),
                            Expanded(
                                child: MyDropdown1(
                              listItems: [
                                S.of(context).selectyourspecialty,
                                'subspecialty2'
                              ],
                              selecteditem: S.of(context).selectyourspecialty,
                            ))
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).ScientificDegree,
                                style: TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            SizedBox(width: 20),
                            Expanded(
                                child: MyDropdown1(
                              listItems: [
                                S.of(context).selectyourScientificDegree,
                                "ScientificDegree 2"
                              ],
                              selecteditem:
                                  S.of(context).selectyourScientificDegree,
                            ))
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(S.of(context).Clincname,
                                  style: TextStyle(
                                      color: AppColor.greenColor,
                                      fontSize: 20)),
                              CustomFormTextField(
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return "Field is required";
                                  }
                                  if (!data.contains(RegExp(r'^[a-zA-Z]+$'))) {
                                    return "Please wrtie clinc name ";
                                  }
                                },
                              )
                            ],
                          )),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(S.of(context).ClincAddress,
                                  style: TextStyle(
                                      color: AppColor.greenColor,
                                      fontSize: 20)),
                              Expanded(child: CustomFormTextField(
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return "Field is required";
                                  }
                                },
                              ))
                            ],
                          )),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(S.of(context).ClincNumber,
                                  style: TextStyle(
                                      color: AppColor.greenColor,
                                      fontSize: 16)),
                              Expanded(
                                  child: IntlPhoneField(
                                      controller: phoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (number) {
                                        if (number!.toString().isEmpty) {
                                          return 'Please enter a phone number';
                                        } else if (number.toString().length !=
                                                11 ||
                                            number!
                                                .toString()
                                                .startsWith('0')) {
                                          return 'Invalid phone number. It must be 11 digits starting with 0.';
                                        }
                                        return null;
                                      }))
                            ],
                          )),
                      Container(
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
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).UploadCertificates,
                                style: TextStyle(
                                    fontSize: 18, color: AppColor.greenColor)),
                            PopupMenuButton(
                                icon: Icon(Icons.upload,
                                    color: AppColor.greenColor),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: MyDropdown2(listItems: [
                                        "UploadImages",
                                        "TakeImages"
                                      ], selecteditem: 'Upload Images'))
                                    ]),
                            SizedBox(width: 50),
                            Text("Uplaod a photo",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 20, 174, 148)))
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).UploadLicense,
                                style: TextStyle(
                                    fontSize: 18, color: AppColor.greenColor)),
                            SizedBox(width: 25),
                            PopupMenuButton(
                                icon: Icon(Icons.upload,
                                    color: AppColor.greenColor),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: MyDropdown2(listItems: [
                                        'Upload Images',
                                        "Take Images"
                                      ], selecteditem: 'Upload Images'))
                                    ]),
                            SizedBox(width: 60),
                            Text("Uplaod a photo",
                                style: TextStyle(
                                    fontSize: 16, color: AppColor.greenColor))
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
            CustomListTile(
                title: S.of(context).MedicalInfo,
                isExpanded: isExpanded,
                childList: [
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).Pleaseadddiagnosisifany,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: IconButton(
                                  color: AppColor.greenColor,
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).Pleaseaddpreviousopreationsifany,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: IconButton(
                                  color: AppColor.greenColor,
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).Pleaseaddmedicationsifany,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(left: 77),
                              child: IconButton(
                                  color: AppColor.greenColor,
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle_outline)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(S.of(context).Describeyourconditionbyvideo,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              SizedBox(width: 80),
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
                          )),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(S.of(context).Describeyourconditionbyvoice,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              IconButton(
                                color: AppColor.greenColor,
                                iconSize: 30,
                                onPressed: () async {},
                                icon: Icon(Icons.upload),
                              ),
           Expanded(
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  child: ElevatedButton.icon(
                                      onPressed: isRecording
                                          ? stopRecording
                                          : startRecording,
                                      icon: Icon(Icons.mic, size: 17),
                                      label: isRecording
                                          ? Text("Stop Rec",
                                              style: TextStyle(fontSize: 14))
                                          : Text("Start Rec",
                                              style:
                                                  TextStyle(fontSize: 12.1))),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ]),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: S.of(context).SignUp,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      //   isLoading = true;
                      Navigator.pushNamed(context, '/home');
                    }
                    ;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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

        audioFile = File(audioPath);
        final storageRef = FirebaseStorage.instance.ref("audio/$audioPath");
        storageRef.putFile(audioFile!);
      });
    } on Exception catch (e) {
      print("Error in stop rec $e");
    }
  }
}
