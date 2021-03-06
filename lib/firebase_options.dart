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
    apiKey: 'AIzaSyBW8vnzbXVMWkEFLKQVe21t6jlesVR3eq8',
    appId: '1:376349290597:web:1f78b0f802ccc128bb168c',
    messagingSenderId: '376349290597',
    projectId: 'jobproject-c9884',
    authDomain: 'jobproject-c9884.firebaseapp.com',
    storageBucket: 'jobproject-c9884.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCchIQSWD45ZUgDrhM1s8UCBuBoSBzIUqI',
    appId: '1:376349290597:android:ffbf004c436b308cbb168c',
    messagingSenderId: '376349290597',
    projectId: 'jobproject-c9884',
    storageBucket: 'jobproject-c9884.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbUQAJYp9TM11IO_WmFlgG7PjcX4rTmf4',
    appId: '1:376349290597:ios:58edfdb5722a4e1fbb168c',
    messagingSenderId: '376349290597',
    projectId: 'jobproject-c9884',
    storageBucket: 'jobproject-c9884.appspot.com',
    iosClientId: '376349290597-3svpdl6nt0ej1g0spukc1hqartbkdci7.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttertask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbUQAJYp9TM11IO_WmFlgG7PjcX4rTmf4',
    appId: '1:376349290597:ios:58edfdb5722a4e1fbb168c',
    messagingSenderId: '376349290597',
    projectId: 'jobproject-c9884',
    storageBucket: 'jobproject-c9884.appspot.com',
    iosClientId: '376349290597-3svpdl6nt0ej1g0spukc1hqartbkdci7.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttertask',
  );
}
