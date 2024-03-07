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
    apiKey: 'AIzaSyC_XPzm5oOgAlALftKg0HM4Bu2vDtiJTfE',
    appId: '1:979501726138:web:5625b8f67433d1d9a7c583',
    messagingSenderId: '979501726138',
    projectId: 'loginbloc-2d525',
    authDomain: 'loginbloc-2d525.firebaseapp.com',
    storageBucket: 'loginbloc-2d525.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvospSIpQ4Ly5WLU0qZhpxLoljfl4b-S4',
    appId: '1:979501726138:android:3c09312999d4d225a7c583',
    messagingSenderId: '979501726138',
    projectId: 'loginbloc-2d525',
    storageBucket: 'loginbloc-2d525.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD08iQBg8NXOyXib8v5V0rsV3uNGXLUhaw',
    appId: '1:979501726138:ios:43d4cc02cd54f7a6a7c583',
    messagingSenderId: '979501726138',
    projectId: 'loginbloc-2d525',
    storageBucket: 'loginbloc-2d525.appspot.com',
    iosBundleId: 'com.example.loginBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD08iQBg8NXOyXib8v5V0rsV3uNGXLUhaw',
    appId: '1:979501726138:ios:48212b664aa17ab9a7c583',
    messagingSenderId: '979501726138',
    projectId: 'loginbloc-2d525',
    storageBucket: 'loginbloc-2d525.appspot.com',
    iosBundleId: 'com.example.loginBloc.RunnerTests',
  );
}