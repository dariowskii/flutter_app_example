import 'dart:io';

class Strings {
  static const instagramAndroidPlayStore =
      'market://details?id=com.instagram.android&hl=it&pli=1';
  static const instagramIosAppStore =
      'https://apps.apple.com/us/app/instagram/id389801252';

  static String get instagramStoreLink {
    if (Platform.isAndroid) {
      return instagramAndroidPlayStore;
    }

    if (Platform.isIOS) {
      return instagramIosAppStore;
    }

    throw UnsupportedError('Unsupported platform');
  }

  static const instagramPackage = 'com.instagram.android';
}
