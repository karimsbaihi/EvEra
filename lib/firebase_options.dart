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
    apiKey: 'AIzaSyA0x3qx3A8M0HfuJNRsJZEV-7ed02KScMA',
    appId: '1:963273493817:web:e2ae964595fd1f55c1ece8',
    messagingSenderId: '963273493817',
    projectId: 'db-test-dc206',
    authDomain: 'db-test-dc206.firebaseapp.com',
    storageBucket: 'db-test-dc206.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJ8CTFnkj3ujdZEat4oVgU5rniuK9ZZfk',
    appId: '1:135416438680:android:d20b7486c80c1e693d15ed',
    messagingSenderId: '135416438680',
    projectId: 'db-test-13f5f',
    databaseURL: 'https://db-test-13f5f-default-rtdb.firebaseio.com',
    storageBucket: 'db-test-13f5f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7KBFlANQyVr2v3BndORtzbMmloU8pgTE',
    appId: '1:963273493817:ios:a90795402c7cb6fbc1ece8',
    messagingSenderId: '963273493817',
    projectId: 'db-test-dc206',
    storageBucket: 'db-test-dc206.firebasestorage.app',
    iosBundleId: 'com.example.evera',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7KBFlANQyVr2v3BndORtzbMmloU8pgTE',
    appId: '1:963273493817:ios:a90795402c7cb6fbc1ece8',
    messagingSenderId: '963273493817',
    projectId: 'db-test-dc206',
    storageBucket: 'db-test-dc206.firebasestorage.app',
    iosBundleId: 'com.example.evera',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA0x3qx3A8M0HfuJNRsJZEV-7ed02KScMA',
    appId: '1:963273493817:web:4270fee637ab935dc1ece8',
    messagingSenderId: '963273493817',
    projectId: 'db-test-dc206',
    authDomain: 'db-test-dc206.firebaseapp.com',
    storageBucket: 'db-test-dc206.firebasestorage.app',
  );

}