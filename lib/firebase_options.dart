// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDFRqu_eYafixaBR1rgh95k4ijBRM-bH9E',
    appId: '1:793745544804:web:596c5c5358c350fdce3171',
    messagingSenderId: '793745544804',
    projectId: 'boom-boom-2e929',
    authDomain: 'boom-boom-2e929.firebaseapp.com',
    storageBucket: 'boom-boom-2e929.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDc5rAOSORls5_HzJ3am1r2cdm9S0teL4g',
    appId: '1:793745544804:android:d09a9285e34a37bbce3171',
    messagingSenderId: '793745544804',
    projectId: 'boom-boom-2e929',
    storageBucket: 'boom-boom-2e929.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwF5aGcv2pyLT0s18BWPN8tGQ9xNWPT4Q',
    appId: '1:793745544804:ios:b9d840308c45508fce3171',
    messagingSenderId: '793745544804',
    projectId: 'boom-boom-2e929',
    storageBucket: 'boom-boom-2e929.appspot.com',
    iosClientId: '793745544804-t5gg5rgs8omctk8un0hu2009ldm56l8f.apps.googleusercontent.com',
    iosBundleId: 'com.example.boomBoom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwF5aGcv2pyLT0s18BWPN8tGQ9xNWPT4Q',
    appId: '1:793745544804:ios:b9d840308c45508fce3171',
    messagingSenderId: '793745544804',
    projectId: 'boom-boom-2e929',
    storageBucket: 'boom-boom-2e929.appspot.com',
    iosClientId: '793745544804-t5gg5rgs8omctk8un0hu2009ldm56l8f.apps.googleusercontent.com',
    iosBundleId: 'com.example.boomBoom',
  );
}
