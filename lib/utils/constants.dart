import 'dart:io';

class Strings {
  static const instagramAndroidPlayStore =
      'https://play.google.com/store/apps/details?id=com.instagram.android&hl=it&pli=1';
  static const instagramIosAppStore =
      'https://apps.apple.com/it/app/instagram/id389801252';

  static String get instagramStoreLink {
    if (Platform.isAndroid) {
      return instagramAndroidPlayStore;
    } else if (Platform.isIOS) {
      return instagramIosAppStore;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
