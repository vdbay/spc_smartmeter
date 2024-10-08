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
    apiKey: 'AIzaSyCYZUV5e-ZZI3URbg3udN-jFAPSEwqm4dU',
    appId: '1:342864669441:web:2e08b295a34dc892600900',
    messagingSenderId: '342864669441',
    projectId: 'spc-smart-meter',
    authDomain: 'spc-smart-meter.firebaseapp.com',
    storageBucket: 'spc-smart-meter.appspot.com',
    measurementId: 'G-BKR5QR7VRF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYwGYd2Qoh7w1x9XmlgNrny5jE9zc4MD4',
    appId: '1:342864669441:android:72930d8648dbef9e600900',
    messagingSenderId: '342864669441',
    projectId: 'spc-smart-meter',
    storageBucket: 'spc-smart-meter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCePY03JXzCxl9kWvvgRpoG0tvkRCzl8NE',
    appId: '1:342864669441:ios:d375aa6123ee9412600900',
    messagingSenderId: '342864669441',
    projectId: 'spc-smart-meter',
    storageBucket: 'spc-smart-meter.appspot.com',
    iosBundleId: 'com.scadaprimacipta.smartmeter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCePY03JXzCxl9kWvvgRpoG0tvkRCzl8NE',
    appId: '1:342864669441:ios:f06beb0f5e558bb9600900',
    messagingSenderId: '342864669441',
    projectId: 'spc-smart-meter',
    storageBucket: 'spc-smart-meter.appspot.com',
    iosBundleId: 'com.scadaprimacipta.smartmeter.RunnerTests',
  );
}
