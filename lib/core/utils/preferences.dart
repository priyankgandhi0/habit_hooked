// // ignore_for_file: constant_identifier_names
//
// import 'dart:io';
//
// import 'package:device_info/device_info.dart';
// import 'package:package_info/package_info.dart';
// import 'package:self_growth/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// final preferences = SharedPreference();
//
// class SharedPreference {
//   static SharedPreferences? _preferences;
//
//   init() async {
//     _preferences ??= await SharedPreferences.getInstance();
//   }
//
//   static const APP_DEVICE_TYPE = "App-Device-Type";
//   static const APP_STORE_VERSION = "App-Store-Version";
//   static const APP_DEVICE_MODEL = "App-Device-Model";
//   static const APP_OS_VERSION = "App-Os-Version";
//   static const APP_STORE_BUILD_NUMBER = "App-Store-Build-Number";
//   static const AUTH_TOKEN = "Auth-Token";
//   static const IS_LOG_IN = "IS_LOG_IN";
//   static const USER_EMAIL = "USER_EMAIL";
//   static const USER_NAME = "USER_NAME";
//   static const USER_PROFILE = "USER_PROFILE";
//   static const PHONE_NUMBER = "PHONE_NUMBER";
//   static const GENDER = "GENDER";
//   static const IS_FILL_QUE = "IS_FILL_QUE";
//   static const IS_ENG = "IS_ENG";
//
//   void clearUserItem() async {
//     _preferences?.clear();
//     _preferences = null;
//     await init();
//     putAppDeviceInfo();
//   }
//
//   putAppDeviceInfo() async {
//     bool isiOS = Platform.isIOS;
//     putString(APP_DEVICE_TYPE, isiOS ? "iOS" : "android");
//     var deviceInfo = await appDeviceInfo();
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//
//     if (isiOS) {
//       IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
//       putString(APP_DEVICE_MODEL, "Test");
//       putString(APP_OS_VERSION, "iOS ${iosDeviceInfo.systemVersion}");
//     } else {
//       AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
//       putString(APP_DEVICE_MODEL, androidDeviceInfo.model);
//       putString(APP_OS_VERSION, androidDeviceInfo.version.release);
//     }
//     putString(APP_STORE_VERSION, packageInfo.version);
//     putString(APP_STORE_BUILD_NUMBER, packageInfo.buildNumber);
//   }
//
//   saveUserItem(UserData userData) {
//     putBool(IS_LOG_IN, true);
//     putString(AUTH_TOKEN, userData.authToken);
//     putString(USER_EMAIL, userData.email);
//     putString(USER_NAME, userData.userName);
//     putString(PHONE_NUMBER, userData.phoneNumber);
//     putString(USER_PROFILE, userData.userProfilePhoto);
//     putString(GENDER, userData.gender);
//   }
//
//   Future<dynamic> appDeviceInfo() async {
//     return Platform.isIOS
//         ? await DeviceInfoPlugin().iosInfo
//         : await DeviceInfoPlugin().androidInfo;
//   }
//
//   Future<bool?> putString(String key, String value) async {
//     if (_preferences==null) {
//       return null;
//     } else {
//       return _preferences!.setString(key, value);
//     }
//   }
//
//   String? getString(String key, {String defValue = ""}) {
//     return _preferences == null
//         ? defValue
//         : _preferences!.getString(key) ?? defValue;
//   }
//
//   Future<bool?> putList(String key, List<String> value) async {
//     if (_preferences == null) {
//       return null;
//     } else {
//       return _preferences!.setStringList(key, value);
//     }
//   }
//
//   List<String>? getList(String key, {List<String> defValue = const []}) {
//     return _preferences == null
//         ? defValue
//         : _preferences!.getStringList(key) ?? defValue;
//   }
//
//   Future<bool?> putInt(String key, int value) async {
//     if (_preferences == null) {
//       return null;
//     } else {
//       return _preferences!.setInt(key, value);
//     }
//   }
//
//   int? getInt(String key, {int defValue = 0}) {
//     return _preferences == null
//         ? defValue
//         : _preferences!.getInt(key) ?? defValue;
//   }
//
//   bool? getBool(String key, {bool defValue = false}) {
//     return _preferences == null
//         ? defValue
//         : _preferences!.getBool(key) ?? defValue;
//   }
//
//   Future<bool?> putBool(String key, bool value) async {
//     if (_preferences == null) {
//       return null;
//     } else {
//       return _preferences!.setBool(key, value);
//     }
//   }
// }
