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
    apiKey: 'AIzaSyCtiUTCBP-Y-By_MhwEq4gjN5Y5aLQxD64',
    appId: '1:503493019078:web:9c3d53102f96ea006b5ec7',
    messagingSenderId: '503493019078',
    projectId: 'digitalsleek-64a4e',
    authDomain: 'digitalsleek-64a4e.firebaseapp.com',
    storageBucket: 'digitalsleek-64a4e.appspot.com',
    measurementId: 'G-Q6B2Y8Q2VF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLGoSqkxWixV9SxavbZ0BsDAi4Yi7N-cU',
    appId: '1:503493019078:android:9216af7936722b426b5ec7',
    messagingSenderId: '503493019078',
    projectId: 'digitalsleek-64a4e',
    storageBucket: 'digitalsleek-64a4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtbhze7iR5DKedp5TKOdFPN5OQ8EUnnvM',
    appId: '1:503493019078:ios:13f2c6971815fe6d6b5ec7',
    messagingSenderId: '503493019078',
    projectId: 'digitalsleek-64a4e',
    storageBucket: 'digitalsleek-64a4e.appspot.com',
    iosClientId: '503493019078-muias48p3l2aj3vmegdq35gue0a6atlo.apps.googleusercontent.com',
    iosBundleId: 'com.itechexpert.digitalsleeks',
  );
}
