import 'dart:developer';
import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:final_project/constans/appcolor.dart';
import 'package:final_project/firebase_serviec/storage_img.dart';
import 'package:final_project/firebase_serviec/storage_vid.dart';
import 'package:final_project/generated/l10n.dart';
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
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:record/record.dart';
import 'package:sizer/sizer.dart';
bool isTextFieldVisible = false;

TextEditingController diagnosesController = TextEditingController();
bool language = false;
bool isExpanded = true;
String? videoUrl;
File? file;
String address = "";
late Record audioRecord;
bool isRecording = false;
String audioPath = "";
File? audioFile;
final box = GetStorage();
TextEditingController idController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController personalAddressController = TextEditingController();
TextEditingController fullNameController = TextEditingController();
TextEditingController specialityController = TextEditingController();
TextEditingController subSpecialityController = TextEditingController();
TextEditingController scientificDegreeController = TextEditingController();
TextEditingController clinicNameController = TextEditingController();
TextEditingController clinicAddressController = TextEditingController();
TextEditingController clinicNumberController = TextEditingController();
String? gender;
String countryValue = "";
late String? stateValue;
late String? cityValue;
String specialityValue = "";
String subSpecialityValue = "";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 25.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1, horizontal: 3.w),
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
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  15),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15)),
                                                  side: BorderSide(
                                                      color: Colors.black87),
                                                ),
                                                backgroundColor: Colors.white,
                                                fixedSize: Size.fromWidth(20.w),
                                              ),
                                              child: const Text(
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
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15)),
                                                ),
                                                side: const BorderSide(
                                                  color: Colors.black87,
                                                ),
                                                backgroundColor: Colors.white,
                                                fixedSize:
                                                    Size.fromWidth(20.w)),
                                            child: const Text(
                                              'العربيه',
                                              style: TextStyle(
                                                color: AppColor
                                                    .greenColor, // Text color
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
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
                                backgroundImage:
                                    Storage.getImage('image') == null
                                        ? const AssetImage('assets/doctor.png')
                                        : Image.memory(
                                            Storage.getImage('image'),
                                          ).image,
                              ),
                            ),
                            Positioned(
                              right: -9,
                              bottom: -7,
                              child: Row(
                                children: [
                                  PopupMenuButton(
                                    icon: const Icon(Icons.camera_alt,
                                        color: AppColor.greenColor),
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: MyDropdown2(
                                          listItems: const [
                                            'Upload Images',
                                            "Take Images",
                                            'delete image'
                                          ],
                                          selecteditem: 'Upload Images',
                                          image: 'image',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomListTile(
                    title: S.of(context).PersonalInfo,
                    isExpanded: isExpanded,
                    childList: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(S.of(context).FullName,
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 20)),
                                CustomFormTextField(
                                  hintText: S.of(context).hint,
                                  obscure: false,
                                  controller: fullNameController,
                                  onSubmitted: (value) {
                                    log(value);
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return "Field is required";
                                    }
                                    if (!data
                                        .contains(RegExp(r'^[a-zA-Z]+$'))) {
                                      return "Please write your name ";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(S.of(context).YourID,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            const SizedBox(width: 44),
                            MyDropdown(listItems: [
                              S.of(context).Passport,
                              S.of(context).ID,
                            ], selecteditem: S.of(context).Passport),
                            Expanded(
                              child: CustomFormTextField(
                                controller: idController,
                                validator: (value) {
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
                                      if (!value
                                          .contains(RegExp(r'^[a-zA-Z]+$'))) {
                                        return "Please make sure ";
                                      }
                                    }
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(S.of(context).Gender,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Icon(Icons.male_sharp),
                                secondary: Text(S.of(context).Male,
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 17)),
                                value: S.of(context).Male,
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      gender = value;
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 45),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Icon(Icons.female_sharp),
                                secondary: Text(
                                  S.of(context).Female,
                                  style: const TextStyle(
                                      color: AppColor.greenColor, fontSize: 17),
                                ),
                                value: S.of(context).Female,
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      gender = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(S.of(context).DateofBirth,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            TextButton(
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2000, 3, 5),
                                    maxTime: DateTime(2024, 1, 21),
                                    onChanged: (date) {
                                  log('change $date');
                                }, onConfirm: (date) {
                                  log('confirm $date');
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: const Text(
                                'show date time picker ',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).PersonalAddress,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
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
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).City,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            const SizedBox(width: 44),
                            Expanded(
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: 130,
                                  child: ListView(
                                    children: [
                                      CSCPicker(
                                        showStates: true,
                                        showCities: true,
                                        flagState:
                                            CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                                        dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1)),
                                        disabledDropdownDecoration:
                                            BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(30)),
                                                color: Colors.grey.shade300,
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1)),
                                        selectedItemStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        dropdownHeadingStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        dropdownItemStyle: const TextStyle(
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
                                        child: const Text(""),
                                      ),
                                      Text(address)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(
                              S.of(context).Mobile,
                              style: const TextStyle(
                                  color: AppColor.greenColor, fontSize: 16),
                            ),
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
                                      number.toString().startsWith('0')) {
                                    return 'Invalid phone number. It must be 11 digits starting with 0.';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(
                              S.of(context).Email,
                              style: const TextStyle(
                                  color: AppColor.greenColor, fontSize: 20),
                            ),
                            Expanded(
                              child: CustomFormTextField(
                                controller: emailController,
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).Password,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            Expanded(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  // if (value.length < 8) {
                                  //   return 'Password must be at least 8 characters long';
                                  // }
                                  // Additional validation for mixed characters
                                  // if (!RegExp(
                                  //         r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$')
                                  //     .hasMatch(value)) {
                                  //   return 'Password must contain at least one uppercase letter, lowercase letter, digit, and special character';
                                  // }
                                  return null;
                                },
                                onSaved: (value) {
                                  passwordController.text = value!;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(S.of(context).ConfirmPassword,
                                style: const TextStyle(
                                    color: AppColor.greenColor, fontSize: 20)),
                            Expanded(
                              child: TextFormField(
                                obscureText: true,
                                controller: confirmPasswordController,
                                decoration: const InputDecoration(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the password again';
                                  }
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  confirmPasswordController.text = value!;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
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
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 20)),
                                const SizedBox(width: 44),
                                Expanded(
                                  child: MyDropdown1(
                                    listItems: [
                                      S.of(context).selectyourspecialty,
                                      "Speaciality2"
                                    ],
                                    selecteditem:
                                        S.of(context).selectyourspecialty,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).subspecialty,
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 20)),
                                const SizedBox(width: 66),
                                Expanded(
                                  child: MyDropdown1(
                                    listItems: [
                                      S.of(context).selectyourspecialty,
                                      'subspecialty2'
                                    ],
                                    selecteditem:
                                        S.of(context).selectyourspecialty,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).ScientificDegree,
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 20)),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: MyDropdown1(
                                    listItems: [
                                      S.of(context).selectyourScientificDegree,
                                      "ScientificDegree 2"
                                    ],
                                    selecteditem: S
                                        .of(context)
                                        .selectyourScientificDegree,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).Clincname,
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 20)),
                                CustomFormTextField(
                                  controller: clinicNameController,
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return "Field is required";
                                    }
                                    if (!data
                                        .contains(RegExp(r'^[a-zA-Z]+$'))) {
                                      return "Please write clinic name";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).ClincAddress,
                                    style: const TextStyle(
                                        color: AppColor.greenColor,
                                        fontSize: 20)),
                                Expanded(
                                  child: CustomFormTextField(
                                    controller: clinicAddressController,
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
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).ClincNumber,
                                    style: const TextStyle(
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
                                          number.toString().startsWith('0')) {
                                        return 'Invalid phone number. It must be 11 digits starting with 0.';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    if (Storage.getImage('image1') == null &&
                                        Storage.getImage('image2') == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please upload all the License and Certificates',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.grey,
                                        ),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                  label: Text(S.of(context).Add),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  S.of(context).UploadCertificates,
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColor.greenColor),
                                ),
                                PopupMenuButton(
                                    icon: const Icon(Icons.upload,
                                        color: AppColor.greenColor),
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: MyDropdown2(
                                              listItems: const [
                                                "UploadImages",
                                                "TakeImages"
                                              ],
                                              selecteditem: 'Upload Images',
                                              image: 'image1',
                                            ),
                                          )
                                        ]),
                                const SizedBox(width: 50),
                                const Text(
                                  "Uplaod a photo",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 20, 174, 148),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).UploadLicense,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: AppColor.greenColor)),
                                const SizedBox(width: 25),
                                PopupMenuButton(
                                  icon: const Icon(Icons.upload,
                                      color: AppColor.greenColor),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: MyDropdown2(
                                        listItems: const [
                                          'Upload Images',
                                          "Take Images",
                                        ],
                                        selecteditem: 'Upload Images',
                                        image: 'image2',
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 60),
                                const Text(
                                  "Uplaod a photo",
                                  style: TextStyle(
                                      fontSize: 16, color: AppColor.greenColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
                                Text(
                                  S.of(context).Pleaseadddiagnosisifany,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: IconButton(
                                    color: AppColor.greenColor,
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  S
                                      .of(context)
                                      .Pleaseaddpreviousopreationsifany,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: IconButton(
                                    color: AppColor.greenColor,
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(S.of(context).Pleaseaddmedicationsifany,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 77),
                                      child: IconButton(
                                          color: AppColor.greenColor, onPressed: () {
                                    setState(() {
                                    isTextFieldVisible = !isTextFieldVisible;
                                    });
                                    },
                                          icon:
                                              const Icon(Icons.add_circle_outline)),
                                    ),

                                  ],
                                ),

                                if (isTextFieldVisible)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: diagnosesController,
                                      decoration: const InputDecoration(
                                        labelText: 'Enter Text',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                const Text("ال Show table   "),
                                Text(diagnosesController.text),
                              ],
                            ),
                          ),
                          Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Text(
                                      S
                                          .of(context)
                                          .Describeyourconditionbyvideo,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.black)),
                                  const SizedBox(width: 80),
                                  IconButton(
                                    color: AppColor.greenColor,
                                    iconSize: 30,
                                    onPressed: () {},
                                    icon: const Icon(Icons.upload),
                                  ),
                                  IconButton(
                                    color: AppColor.greenColor,
                                    iconSize: 30,
                                    onPressed: pickVideo,
                                    icon: const Icon(Icons.videocam),
                                  )
                                ],
                              )),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(S.of(context).Describeyourconditionbyvoice,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black)),
                                IconButton(
                                  color: AppColor.greenColor,
                                  iconSize: 30,
                                  onPressed: () async {},
                                  icon: const Icon(Icons.upload),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 70,
                                    height: 40,
                                    child: ElevatedButton.icon(
                                      onPressed: isRecording
                                          ? stopRecording
                                          : startRecording,
                                      icon: const Icon(Icons.mic, size: 17),
                                      label: isRecording
                                          ? const Text(
                                              "Stop Rec",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          : const Text(
                                              "Start Rec",
                                              style: TextStyle(fontSize: 12.1),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: S.of(context).SignUp,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            box.write('email', emailController.text);
                            box.write('password', passwordController.text);
                            box.write('confirmPassword',
                                confirmPasswordController.text);
                            box.write('fullName', fullNameController.text);
                            box.write('id', idController.text);
                            box.write(
                                'phoneNumber', phoneNumberController.text);
                            box.write('personalAddress',
                                personalAddressController.text);
                            box.write('clinicName', clinicNameController.text);
                            box.write(
                                'clinicAddress', clinicAddressController.text);
                            box.write(
                                'clinicNumber', clinicNumberController.text);
                            box.write('gender', gender);
                            box.write('country', countryValue);
                            box.write('state', stateValue);
                            box.write('city', cityValue);
                            box.write('speciality', specialityValue);
                            box.write('subSpeciality', subSpecialityValue);
                            box.write('scientificDegree',
                                scientificDegreeController.text);
                            if (Storage.getImage('image1') == null &&
                                Storage.getImage('image2') == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please upload all the License and Certificates',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                              );
                            }
                            if (isExpanded == true) {
                              Navigator.pushNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please fill all the fields',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickVideo() async {
    try {
      videoUrl = await pickdVideo();

      file = File(videoUrl!);
      final storageRef = FirebaseStorage.instance.ref("vid/$videoUrl");
      await storageRef.putFile(file!);
    } on Exception catch (e) {
      log("error in uploading $e");
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
      log("Error in start rec $e");
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
      log("Error in stop rec $e");
    }
  }
}
