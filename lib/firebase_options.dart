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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMR9XJlvqP3X6RnZ00jw0ZXVWfl-ODovE',
    appId: '1:262488980065:android:4f5ef597ff232bbe840820',
    messagingSenderId: '262488980065',
    projectId: 'leave-mangement2',
    storageBucket: 'leave-mangement2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBljWbUrtVFncJddLOpkx-7oAJhaoIGhEU',
    appId: '1:262488980065:ios:265455c875c3531c840820',
    messagingSenderId: '262488980065',
    projectId: 'leave-mangement2',
    storageBucket: 'leave-mangement2.appspot.com',
    iosClientId: '262488980065-1qjo7kobaek19d4cml16cdko50furufk.apps.googleusercontent.com',
    iosBundleId: 'com.example.leaveManagement',
  );
  static const FirebaseOptions  web = FirebaseOptions(
    apiKey: "AIzaSyDzcUgLbiZVL0VCH9UmnwGNyXkyjDEH12E",
    authDomain: "leave-mangement2.firebaseapp.com",
    projectId: "leave-mangement2",
    storageBucket: "leave-mangement2.appspot.com",
    messagingSenderId: "262488980065",
    appId: "1:262488980065:web:5eea743ebabbeefd840820"
  );
}
