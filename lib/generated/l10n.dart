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

  /// `Department`
  String get Department {
    return Intl.message(
      'Department',
      name: 'Department',
      desc: '',
      args: [],
    );
  }

  /// `My Notifications`
  String get My_Notification {
    return Intl.message(
      'My Notifications',
      name: 'My_Notification',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get Sign_out {
    return Intl.message(
      'Sign out',
      name: 'Sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get theme {
    return Intl.message(
      'Dark Mode',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `arabic language`
  String get change_languge {
    return Intl.message(
      'arabic language',
      name: 'change_languge',
      desc: '',
      args: [],
    );
  }

  /// `Register as Hospital`
  String get register_as_hospital {
    return Intl.message(
      'Register as Hospital',
      name: 'register_as_hospital',
      desc: '',
      args: [],
    );
  }

  /// `Register as User`
  String get Register_as_User {
    return Intl.message(
      'Register as User',
      name: 'Register_as_User',
      desc: '',
      args: [],
    );
  }

  /// `Or Contact us`
  String get Or_Contact_us {
    return Intl.message(
      'Or Contact us',
      name: 'Or_Contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Enter secret key`
  String get enter_secret_key {
    return Intl.message(
      'Enter secret key',
      name: 'enter_secret_key',
      desc: '',
      args: [],
    );
  }

  /// `Hospital Register`
  String get Hospital_register {
    return Intl.message(
      'Hospital Register',
      name: 'Hospital_register',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Sign_in {
    return Intl.message(
      'Sign in',
      name: 'Sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Or Login With`
  String get Or_Login_With {
    return Intl.message(
      'Or Login With',
      name: 'Or_Login_With',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get Forget_Password {
    return Intl.message(
      'Forget Password',
      name: 'Forget_Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_you_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_you_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get Email_address {
    return Intl.message(
      'Email Address',
      name: 'Email_address',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Enter_your_email ' key

  /// `Welcome to BLD`
  String get Welcome_to_BLD {
    return Intl.message(
      'Welcome to BLD',
      name: 'Welcome_to_BLD',
      desc: '',
      args: [],
    );
  }

  /// `Login to discover more services`
  String get Login_to_discover_more_services {
    return Intl.message(
      'Login to discover more services',
      name: 'Login_to_discover_more_services',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'You_don\'t_have_an_account?' key

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Create Qr`
  String get create_Qr {
    return Intl.message(
      'Create Qr',
      name: 'create_Qr',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
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

  /// `Remove`
  String get Remove {
    return Intl.message(
      'Remove',
      name: 'Remove',
      desc: '',
      args: [],
    );
  }

  /// `Check Donor`
  String get Check_Donor {
    return Intl.message(
      'Check Donor',
      name: 'Check_Donor',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get Info {
    return Intl.message(
      'Info',
      name: 'Info',
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

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `Add Blood Type`
  String get Add_Blood_Type {
    return Intl.message(
      'Add Blood Type',
      name: 'Add_Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `Blood Type`
  String get Blood_Type {
    return Intl.message(
      'Blood Type',
      name: 'Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `Serial Num`
  String get Serial_Num {
    return Intl.message(
      'Serial Num',
      name: 'Serial_Num',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `Search by Serial Num`
  String get Search_by_Serial_Num {
    return Intl.message(
      'Search by Serial Num',
      name: 'Search_by_Serial_Num',
      desc: '',
      args: [],
    );
  }

  /// `Remove Blood Type`
  String get Remove_Blood_Type {
    return Intl.message(
      'Remove Blood Type',
      name: 'Remove_Blood_Type',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Sign_up {
    return Intl.message(
      'Sign up',
      name: 'Sign_up',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get First_Name {
    return Intl.message(
      'First Name',
      name: 'First_Name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get Last_Name {
    return Intl.message(
      'Last Name',
      name: 'Last_Name',
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

  /// `Enter a password`
  String get Enter_a_password {
    return Intl.message(
      'Enter a password',
      name: 'Enter_a_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get Confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get Already_have_an_account {
    return Intl.message(
      'Already have an account',
      name: 'Already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Login to dicover more services`
  String get Login_to_dicover_more_services {
    return Intl.message(
      'Login to dicover more services',
      name: 'Login_to_dicover_more_services',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'ٌRest_password' key

  // skipped getter for the 'Please,_Enter_your_email_to_rest_password' key

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `This email has already exist`
  String get this_email_has_already_exist {
    return Intl.message(
      'This email has already exist',
      name: 'this_email_has_already_exist',
      desc: '',
      args: [],
    );
  }

  /// `Successfull`
  String get successfull {
    return Intl.message(
      'Successfull',
      name: 'successfull',
      desc: '',
      args: [],
    );
  }

  /// `Blood type is added`
  String get Blood_type_is_added {
    return Intl.message(
      'Blood type is added',
      name: 'Blood_type_is_added',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Donor Name`
  String get Donor_Name {
    return Intl.message(
      'Donor Name',
      name: 'Donor_Name',
      desc: '',
      args: [],
    );
  }

  /// `Notional Id`
  String get Notional_Id {
    return Intl.message(
      'Notional Id',
      name: 'Notional_Id',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get Expired {
    return Intl.message(
      'Expired',
      name: 'Expired',
      desc: '',
      args: [],
    );
  }

  /// `Add more data`
  String get add_more_data {
    return Intl.message(
      'Add more data',
      name: 'add_more_data',
      desc: '',
      args: [],
    );
  }

  /// `Blood type`
  String get Blood_type {
    return Intl.message(
      'Blood type',
      name: 'Blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Create QR Blood Type`
  String get create_qr_blood_type {
    return Intl.message(
      'Create QR Blood Type',
      name: 'create_qr_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Blood Locator Donation`
  String get Blood_Locator_Donation {
    return Intl.message(
      'Blood Locator Donation',
      name: 'Blood_Locator_Donation',
      desc: '',
      args: [],
    );
  }

  /// `Donate blood`
  String get Donate_blood {
    return Intl.message(
      'Donate blood',
      name: 'Donate_blood',
      desc: '',
      args: [],
    );
  }

  /// `Find blood type`
  String get Find_blood_type {
    return Intl.message(
      'Find blood type',
      name: 'Find_blood_type',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Choose_the_service_you_want ' key

  /// `Hello`
  String get Hello {
    return Intl.message(
      'Hello',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Blood donate`
  String get blood_donate {
    return Intl.message(
      'Blood donate',
      name: 'blood_donate',
      desc: '',
      args: [],
    );
  }

  /// `Find blood type`
  String get find_blood_type {
    return Intl.message(
      'Find blood type',
      name: 'find_blood_type',
      desc: '',
      args: [],
    );
  }

  /// `Permission`
  String get permission {
    return Intl.message(
      'Permission',
      name: 'permission',
      desc: '',
      args: [],
    );
  }

  /// `Find closest blood type`
  String get Find_closest_blood_type {
    return Intl.message(
      'Find closest blood type',
      name: 'Find_closest_blood_type',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'find_the_closest_blood_type_for_you ' key

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Pregnancy`
  String get pregnancy {
    return Intl.message(
      'Pregnancy',
      name: 'pregnancy',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'smoking ' key

  /// `Step 1`
  String get step_1 {
    return Intl.message(
      'Step 1',
      name: 'step_1',
      desc: '',
      args: [],
    );
  }

  /// `Step 2`
  String get step_2 {
    return Intl.message(
      'Step 2',
      name: 'step_2',
      desc: '',
      args: [],
    );
  }

  /// `Step 3`
  String get step_3 {
    return Intl.message(
      'Step 3',
      name: 'step_3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Blood Pressure`
  String get Blood_Pressure {
    return Intl.message(
      'Blood Pressure',
      name: 'Blood_Pressure',
      desc: '',
      args: [],
    );
  }

  /// `Level of Hemoglobin`
  String get Level_of_hemoglobin {
    return Intl.message(
      'Level of Hemoglobin',
      name: 'Level_of_hemoglobin',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message(
      'Age',
      name: 'Age',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get BMI {
    return Intl.message(
      'BMI',
      name: 'BMI',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Level of Hemglobin`
  String get Enter_your_level_of_hemglobin {
    return Intl.message(
      'Enter your Level of Hemglobin',
      name: 'Enter_your_level_of_hemglobin',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Enter_Your_Age ' key

  // skipped getter for the 'Enter_your_Weight ' key

  /// `Chronic Kidney Diseases`
  String get Chronic_Kidney_Diseases {
    return Intl.message(
      'Chronic Kidney Diseases',
      name: 'Chronic_Kidney_Diseases',
      desc: '',
      args: [],
    );
  }

  /// `Adrenal And Thyroid Disorders`
  String get Adrenal_And_Thyroid_Disorders {
    return Intl.message(
      'Adrenal And Thyroid Disorders',
      name: 'Adrenal_And_Thyroid_Disorders',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Have_you_donated_previously?' key

  // skipped getter for the 'Select_Your_blood_type ' key

  /// `Finish`
  String get Finish {
    return Intl.message(
      'Finish',
      name: 'Finish',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get User_Name {
    return Intl.message(
      'User Name',
      name: 'User_Name',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get Place {
    return Intl.message(
      'Place',
      name: 'Place',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phone_Number {
    return Intl.message(
      'Phone Number',
      name: 'Phone_Number',
      desc: '',
      args: [],
    );
  }

  /// `Send Notification`
  String get Send_Notification {
    return Intl.message(
      'Send Notification',
      name: 'Send_Notification',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get Verify_your_email {
    return Intl.message(
      'Verify your email',
      name: 'Verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email to continue registration`
  String get Please_verify_your_email_to_continue_registration {
    return Intl.message(
      'Please verify your email to continue registration',
      name: 'Please_verify_your_email_to_continue_registration',
      desc: '',
      args: [],
    );
  }

  /// `Location Required`
  String get Location_Required {
    return Intl.message(
      'Location Required',
      name: 'Location_Required',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Please_enable_location_services_and_app_permissions_to_continue ' key

  // skipped getter for the 'open_location_settings ' key

  /// `Open App Settings`
  String get Open_App_Settings {
    return Intl.message(
      'Open App Settings',
      name: 'Open_App_Settings',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Now,_You_can_donate' key

  /// `you can go to the closest needed hospital to donate`
  String get you_can_go_to_the_closest_needed_hospital_to_donate {
    return Intl.message(
      'you can go to the closest needed hospital to donate',
      name: 'you_can_go_to_the_closest_needed_hospital_to_donate',
      desc: '',
      args: [],
    );
  }

  /// `please wait for check your information`
  String get please_wait_for_check_your_information {
    return Intl.message(
      'please wait for check your information',
      name: 'please_wait_for_check_your_information',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'sorry,_you_can\'t_donate' key

  /// `Something went wrong`
  String get Something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'Something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get Loding {
    return Intl.message(
      'loading',
      name: 'Loding',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'According_to_the_personal_examination_analysis,_you_can\'t_donate_blood' key
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
