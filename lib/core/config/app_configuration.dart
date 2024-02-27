import 'package:hire_app/core/config/flavor.dart';

class AppConfiguration {
  static Flavor flavor = Flavor.prod;

  static String baseURL = const String.fromEnvironment('BASE_URL');
  static String get messagingSenderId =>
      const String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static String get projectId =>
      const String.fromEnvironment('FIREBASE_PROJECT_ID');
  static String get storageBucket =>
      const String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
  static String get iosBundleId =>
      const String.fromEnvironment('FIREBASE_IOS_BUNDLE_ID');
  static String get androidAppId =>
      const String.fromEnvironment('FIREBASE_ANDROID_APP_ID');
  static String get androidApiKey =>
      const String.fromEnvironment('FIREBASE_ANDROID_API_KEY');
  static String get iosAppId =>
      const String.fromEnvironment('FIREBASE_IOS_APP_ID');
  static String get iosApiKey =>
      const String.fromEnvironment('FIREBASE_IOS_API_KEY');
}
