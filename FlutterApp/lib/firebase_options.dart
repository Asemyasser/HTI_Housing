// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB6WaTM_pTcSXRZOqGI7LNkPBRC94dqog8',
    appId: '1:149159194653:web:ac736cae9ca5658f20d6f4',
    messagingSenderId: '149159194653',
    projectId: 'finalproject-7a789',
    authDomain: 'finalproject-7a789.firebaseapp.com',
    storageBucket: 'finalproject-7a789.firebasestorage.app',
    measurementId: 'G-45WDRBVTVC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAg5CS4opTmHEmIMa_HOyIslkXsfnqkU5s',
    appId: '1:149159194653:android:e55e8fb0fce05e8120d6f4',
    messagingSenderId: '149159194653',
    projectId: 'finalproject-7a789',
    storageBucket: 'finalproject-7a789.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuVhhXS6pf3bEzhMzOnyCs1wZBDpgfilo',
    appId: '1:149159194653:ios:c2754b74f95bfbdd20d6f4',
    messagingSenderId: '149159194653',
    projectId: 'finalproject-7a789',
    storageBucket: 'finalproject-7a789.firebasestorage.app',
    iosBundleId: 'com.example.finalproject2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuVhhXS6pf3bEzhMzOnyCs1wZBDpgfilo',
    appId: '1:149159194653:ios:c2754b74f95bfbdd20d6f4',
    messagingSenderId: '149159194653',
    projectId: 'finalproject-7a789',
    storageBucket: 'finalproject-7a789.firebasestorage.app',
    iosBundleId: 'com.example.finalproject2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB6WaTM_pTcSXRZOqGI7LNkPBRC94dqog8',
    appId: '1:149159194653:web:7f0e711758f03afc20d6f4',
    messagingSenderId: '149159194653',
    projectId: 'finalproject-7a789',
    authDomain: 'finalproject-7a789.firebaseapp.com',
    storageBucket: 'finalproject-7a789.firebasestorage.app',
    measurementId: 'G-XV2CRKL6JL',
  );
}
