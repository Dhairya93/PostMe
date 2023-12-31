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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDEwgweAkwCElKuWHYt3m47kWvG52sfH3U',
    appId: '1:36951645011:web:646cdf1823d09e78431fa6',
    messagingSenderId: '36951645011',
    projectId: 'chatzone-gpt',
    authDomain: 'chatzone-gpt.firebaseapp.com',
    storageBucket: 'chatzone-gpt.appspot.com',
    measurementId: 'G-NM5XMFVDG9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFeZ-S7D28F6pXtquSst-OJM26bYFcla8',
    appId: '1:36951645011:android:580cd78a71f7c0e6431fa6',
    messagingSenderId: '36951645011',
    projectId: 'chatzone-gpt',
    storageBucket: 'chatzone-gpt.appspot.com',
  );
}
