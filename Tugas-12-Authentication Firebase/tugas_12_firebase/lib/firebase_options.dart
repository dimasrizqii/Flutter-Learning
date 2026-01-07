import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyB_CgzLpiT1Eajl1VpWmxsOClS7qk40zR4',
    appId: '1:790804602576:web:86306a004f4b7e7c6dc8d5',
    messagingSenderId: '790804602576',
    projectId: 'fir-auth-flutter-5fc6a',
    authDomain: 'fir-auth-flutter-5fc6a.firebaseapp.com',
    storageBucket: 'fir-auth-flutter-5fc6a.firebasestorage.app',
    measurementId: 'G-MJ62KTRLQ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj6O-30kPT3fbgsuaPUa1zrppq-ZWzMU0',
    appId: '1:790804602576:android:c33fdb24afe162b76dc8d5',
    messagingSenderId: '790804602576',
    projectId: 'fir-auth-flutter-5fc6a',
    storageBucket: 'fir-auth-flutter-5fc6a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKDU4s7cUdO0-5Bz1X-tLmaFajTrmNDT4',
    appId: '1:790804602576:ios:556ef18344ec256d6dc8d5',
    messagingSenderId: '790804602576',
    projectId: 'fir-auth-flutter-5fc6a',
    storageBucket: 'fir-auth-flutter-5fc6a.firebasestorage.app',
    iosClientId:
        '790804602576-1788s215ord13d8lvnii2chdst1lvh10.apps.googleusercontent.com',
    iosBundleId: 'com.example.tugas12Firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKDU4s7cUdO0-5Bz1X-tLmaFajTrmNDT4',
    appId: '1:790804602576:ios:556ef18344ec256d6dc8d5',
    messagingSenderId: '790804602576',
    projectId: 'fir-auth-flutter-5fc6a',
    storageBucket: 'fir-auth-flutter-5fc6a.firebasestorage.app',
    iosClientId:
        '790804602576-1788s215ord13d8lvnii2chdst1lvh10.apps.googleusercontent.com',
    iosBundleId: 'com.example.tugas12Firebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_CgzLpiT1Eajl1VpWmxsOClS7qk40zR4',
    appId: '1:790804602576:web:6f85ea43026fef876dc8d5',
    messagingSenderId: '790804602576',
    projectId: 'fir-auth-flutter-5fc6a',
    authDomain: 'fir-auth-flutter-5fc6a.firebaseapp.com',
    storageBucket: 'fir-auth-flutter-5fc6a.firebasestorage.app',
    measurementId: 'G-7CJREENQ15',
  );
}
