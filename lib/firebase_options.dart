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
    apiKey: 'AIzaSyAibbFch0fpk_3mmfOGpAYSo6B-k9PyvEc',
    appId: '1:716089255536:web:6241eeb5c1ae9ea6d8b6b5',
    messagingSenderId: '716089255536',
    projectId: 'plants-f63ac',
    authDomain: 'plants-f63ac.firebaseapp.com',
    storageBucket: 'plants-f63ac.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9zTLeP0rGzQ6_8GZsZs9xL8SwgBILTjo',
    appId: '1:716089255536:android:89baefd53d4bba8ed8b6b5',
    messagingSenderId: '716089255536',
    projectId: 'plants-f63ac',
    storageBucket: 'plants-f63ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDZl1Df8JuRxzKEH4rnHUd_bUSYKNwkzA',
    appId: '1:716089255536:ios:091f6cada1eb5d1cd8b6b5',
    messagingSenderId: '716089255536',
    projectId: 'plants-f63ac',
    storageBucket: 'plants-f63ac.appspot.com',
    iosBundleId: 'com.example.plantsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDZl1Df8JuRxzKEH4rnHUd_bUSYKNwkzA',
    appId: '1:716089255536:ios:091f6cada1eb5d1cd8b6b5',
    messagingSenderId: '716089255536',
    projectId: 'plants-f63ac',
    storageBucket: 'plants-f63ac.appspot.com',
    iosBundleId: 'com.example.plantsApp',
  );
}
