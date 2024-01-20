// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Medical Info`
  String get MedicalInfo {
    return Intl.message(
      'Medical Info',
      name: 'MedicalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get PersonalInfo {
    return Intl.message(
      'Personal Info',
      name: 'PersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Work Info`
  String get WorkInfo {
    return Intl.message(
      'Work Info',
      name: 'WorkInfo',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Your ID`
  String get YourID {
    return Intl.message(
      'Your ID',
      name: 'YourID',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get Passport {
    return Intl.message(
      'Passport',
      name: 'Passport',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get ID {
    return Intl.message(
      'ID',
      name: 'ID',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get DateofBirth {
    return Intl.message(
      'Date of Birth',
      name: 'DateofBirth',
      desc: '',
      args: [],
    );
  }

  /// `Personal Address`
  String get PersonalAddress {
    return Intl.message(
      'Personal Address',
      name: 'PersonalAddress',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `Select Your City`
  String get SelectyourCity {
    return Intl.message(
      'Select Your City',
      name: 'SelectyourCity',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get Mobile {
    return Intl.message(
      'Mobile',
      name: 'Mobile',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Main Speciality`
  String get MainSpeciality {
    return Intl.message(
      'Main Speciality',
      name: 'MainSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `select your specialty`
  String get selectyourspecialty {
    return Intl.message(
      'select your specialty',
      name: 'selectyourspecialty',
      desc: '',
      args: [],
    );
  }

  /// `sub specialty`
  String get subspecialty {
    return Intl.message(
      'sub specialty',
      name: 'subspecialty',
      desc: '',
      args: [],
    );
  }

  /// `select your sub specialty`
  String get selectyoursubspecialty {
    return Intl.message(
      'select your sub specialty',
      name: 'selectyoursubspecialty',
      desc: '',
      args: [],
    );
  }

  /// `Scientific Degree`
  String get ScientificDegree {
    return Intl.message(
      'Scientific Degree',
      name: 'ScientificDegree',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'selectyourScientificDegree ' key

  /// `Clinc name`
  String get Clincname {
    return Intl.message(
      'Clinc name',
      name: 'Clincname',
      desc: '',
      args: [],
    );
  }

  /// `Clinc Address`
  String get ClincAddress {
    return Intl.message(
      'Clinc Address',
      name: 'ClincAddress',
      desc: '',
      args: [],
    );
  }

  /// `Clinc Number`
  String get ClincNumber {
    return Intl.message(
      'Clinc Number',
      name: 'ClincNumber',
      desc: '',
      args: [],
    );
  }

  /// `Upload Certificates`
  String get UploadCertificates {
    return Intl.message(
      'Upload Certificates',
      name: 'UploadCertificates',
      desc: '',
      args: [],
    );
  }

  /// `Upload License`
  String get UploadLicense {
    return Intl.message(
      'Upload License',
      name: 'UploadLicense',
      desc: '',
      args: [],
    );
  }

  /// `Please add diagnosis if any`
  String get Pleaseadddiagnosisifany {
    return Intl.message(
      'Please add diagnosis if any',
      name: 'Pleaseadddiagnosisifany',
      desc: '',
      args: [],
    );
  }

  /// `Please add medications if any`
  String get Pleaseaddmedicationsifany {
    return Intl.message(
      'Please add medications if any',
      name: 'Pleaseaddmedicationsifany',
      desc: '',
      args: [],
    );
  }

  /// `Please add previous opreations if any`
  String get Pleaseaddpreviousopreationsifany {
    return Intl.message(
      'Please add previous opreations if any',
      name: 'Pleaseaddpreviousopreationsifany',
      desc: '',
      args: [],
    );
  }

  /// `Describe your condition \n             by video`
  String get Describeyourconditionbyvideo {
    return Intl.message(
      'Describe your condition \n             by video',
      name: 'Describeyourconditionbyvideo',
      desc: '',
      args: [],
    );
  }

  /// `Describe your condition \n             by voice`
  String get Describeyourconditionbyvoice {
    return Intl.message(
      'Describe your condition \n             by voice',
      name: 'Describeyourconditionbyvoice',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get Dashboard {
    return Intl.message(
      'Dashboard',
      name: 'Dashboard',
      desc: '',
      args: [],
    );
  }

  /// `OVR`
  String get OVR {
    return Intl.message(
      'OVR',
      name: 'OVR',
      desc: '',
      args: [],
    );
  }

  /// `KPIS`
  String get KPIS {
    return Intl.message(
      'KPIS',
      name: 'KPIS',
      desc: '',
      args: [],
    );
  }

  /// `Staff Risk`
  String get StaffRisk {
    return Intl.message(
      'Staff Risk',
      name: 'StaffRisk',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'PCR&ICRA' key

  /// `Clinical Risks`
  String get ClinicalRisks {
    return Intl.message(
      'Clinical Risks',
      name: 'ClinicalRisks',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'DarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Full Name here ...`
  String get hint {
    return Intl.message(
      'Enter your Full Name here ...',
      name: 'hint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
