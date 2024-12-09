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
    apiKey: 'AIzaSyDvIPcF_JwbQruNBLVambaCTOcQByOXoz4',
    appId: '1:660386846325:web:a105bae8b52d4a902a8a3c',
    messagingSenderId: '660386846325',
    projectId: 'project-mobile-fe349',
    authDomain: 'project-mobile-fe349.firebaseapp.com',
    storageBucket: 'project-mobile-fe349.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxfT1OvaZeNAItqdLp41wbfFZLMguHaPY',
    appId: '1:660386846325:android:e034f6574dc992312a8a3c',
    messagingSenderId: '660386846325',
    projectId: 'project-mobile-fe349',
    storageBucket: 'project-mobile-fe349.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwSM0mpqvcPdlP2zEY4CeZD1P9cjQ0W88',
    appId: '1:660386846325:ios:9619be2285b8d4342a8a3c',
    messagingSenderId: '660386846325',
    projectId: 'project-mobile-fe349',
    storageBucket: 'project-mobile-fe349.appspot.com',
    iosBundleId: 'com.example.projectMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwSM0mpqvcPdlP2zEY4CeZD1P9cjQ0W88',
    appId: '1:660386846325:ios:9619be2285b8d4342a8a3c',
    messagingSenderId: '660386846325',
    projectId: 'project-mobile-fe349',
    storageBucket: 'project-mobile-fe349.appspot.com',
    iosBundleId: 'com.example.projectMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDvIPcF_JwbQruNBLVambaCTOcQByOXoz4',
    appId: '1:660386846325:web:ca226f14dc2c321d2a8a3c',
    messagingSenderId: '660386846325',
    projectId: 'project-mobile-fe349',
    authDomain: 'project-mobile-fe349.firebaseapp.com',
    storageBucket: 'project-mobile-fe349.appspot.com',
  );
}
