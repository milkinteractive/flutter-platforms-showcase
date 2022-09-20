// source https://github.com/jonataslaw/getx/blob/756580576e45f47f8d5d4392db9427cb972efdfb/lib/get_utils/src/platform/platform.dart

import 'platform_web_extension.dart'
    if (dart.library.io) 'platform_io_extension.dart';

// ignore: avoid_classes_with_only_static_members
class Platform {
  static bool get isWeb => GeneralPlatform.isWeb;

  static bool get isMacOS => GeneralPlatform.isMacOS;

  static bool get isWindows => GeneralPlatform.isWindows;

  static bool get isLinux => GeneralPlatform.isLinux;

  static bool get isAndroid => GeneralPlatform.isAndroid;

  static bool get isIOS => GeneralPlatform.isIOS;

  static bool get isFuchsia => GeneralPlatform.isFuchsia;

  static bool get isMobile => Platform.isIOS || Platform.isAndroid;

  static bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
}
