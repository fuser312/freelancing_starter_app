import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3449652107733008/2177658006";
    }  else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3449652107733008/2177658006";
    }  else {
      throw new UnsupportedError("Unsupported platform");
    }
  }


}