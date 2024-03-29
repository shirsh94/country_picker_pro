import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformInfo {
  static String get platformName {
    if (kIsWeb) {
      return "Web";
    } else if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "IOS";
    } else if (Platform.isFuchsia) {
      return "Fuchsia";
    } else if (Platform.isLinux) {
      return "Linux";
    } else if (Platform.isMacOS) {
      return "MacOS";
    } else if (Platform.isWindows) {
      return "Windows";
    } else {
      return "Unknown";
    }
  }
}
