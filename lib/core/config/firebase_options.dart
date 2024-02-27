import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:hire_app/core/config/app_configuration.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform. '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static FirebaseOptions android = FirebaseOptions(
    appId: AppConfiguration.androidAppId,
    apiKey: AppConfiguration.androidApiKey,
    projectId: AppConfiguration.projectId,
    storageBucket: AppConfiguration.storageBucket,
    messagingSenderId: AppConfiguration.messagingSenderId,
  );

  static FirebaseOptions ios = FirebaseOptions(
    appId: AppConfiguration.iosAppId,
    apiKey: AppConfiguration.iosApiKey,
    projectId: AppConfiguration.projectId,
    iosBundleId: AppConfiguration.iosBundleId,
    storageBucket: AppConfiguration.storageBucket,
    messagingSenderId: AppConfiguration.messagingSenderId,
  );
}
