class RequestParam {
  static const service = "Service"; // -> pass method name
  static const showError = "show_error"; // -> bool in String
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
}

const bool isLiveMode = false;
String userTypeApp = ''; //user,mentor

enum Gender {
  // ignore: constant_identifier_names
  Male,
  // ignore: constant_identifier_names
  Female,
  // ignore: constant_identifier_names
  Other,
}
