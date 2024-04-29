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
    apiKey: 'AIzaSyDsKUAAzYzMCoyxFx8e7MyWZGUUYJMmVa0',
    appId: '1:962514713942:web:6f1b78d06b8cedf4312af7',
    messagingSenderId: '962514713942',
    projectId: 'casestudy-d9704',
    authDomain: 'casestudy-d9704.firebaseapp.com',
    storageBucket: 'casestudy-d9704.appspot.com',
    measurementId: 'G-S2J4YBSK4S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIWuU4V2dBW9D2zJu14qmppcnFl-7TeN4',
    appId: '1:962514713942:android:19047e752b945ad6312af7',
    messagingSenderId: '962514713942',
    projectId: 'casestudy-d9704',
    storageBucket: 'casestudy-d9704.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4cS8zGnz6nBcocJ2mmyLij91UaFs3jLo',
    appId: '1:962514713942:ios:447a0791ad52c24d312af7',
    messagingSenderId: '962514713942',
    projectId: 'casestudy-d9704',
    storageBucket: 'casestudy-d9704.appspot.com',
    iosBundleId: 'com.example.caseStudy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4cS8zGnz6nBcocJ2mmyLij91UaFs3jLo',
    appId: '1:962514713942:ios:447a0791ad52c24d312af7',
    messagingSenderId: '962514713942',
    projectId: 'casestudy-d9704',
    storageBucket: 'casestudy-d9704.appspot.com',
    iosBundleId: 'com.example.caseStudy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDsKUAAzYzMCoyxFx8e7MyWZGUUYJMmVa0',
    appId: '1:962514713942:web:e1654173acaf2ddf312af7',
    messagingSenderId: '962514713942',
    projectId: 'casestudy-d9704',
    authDomain: 'casestudy-d9704.firebaseapp.com',
    storageBucket: 'casestudy-d9704.appspot.com',
    measurementId: 'G-GR44HXB0CN',
  );
}