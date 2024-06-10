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
    apiKey: 'AIzaSyCZ6haAd_p8GNRzzUY8fn0YffkJSnkukzY',
    appId: '1:733280171641:web:fb6530f3bd72badb51c6a8',
    messagingSenderId: '733280171641',
    projectId: 'panda-mobile-unair',
    authDomain: 'panda-mobile-unair.firebaseapp.com',
    databaseURL: 'https://panda-mobile-unair-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'panda-mobile-unair.appspot.com',
    measurementId: 'G-CKQ7EE9WQZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGPaVP31s8G4F60Nxd9yEce4VFr33MwnI',
    appId: '1:733280171641:android:5076ce87289b5ce751c6a8',
    messagingSenderId: '733280171641',
    projectId: 'panda-mobile-unair',
    databaseURL: 'https://panda-mobile-unair-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'panda-mobile-unair.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhg4VRn9nJhwsd76NHRUBR8TYTqDmu4SE',
    appId: '1:733280171641:ios:cde0db8242bc74d351c6a8',
    messagingSenderId: '733280171641',
    projectId: 'panda-mobile-unair',
    databaseURL: 'https://panda-mobile-unair-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'panda-mobile-unair.appspot.com',
    iosClientId: '733280171641-466n8dtl3vgb5v1k8bcuhaa5fb8rer4q.apps.googleusercontent.com',
    iosBundleId: 'com.example.fePandaUnair',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhg4VRn9nJhwsd76NHRUBR8TYTqDmu4SE',
    appId: '1:733280171641:ios:cde0db8242bc74d351c6a8',
    messagingSenderId: '733280171641',
    projectId: 'panda-mobile-unair',
    databaseURL: 'https://panda-mobile-unair-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'panda-mobile-unair.appspot.com',
    iosClientId: '733280171641-466n8dtl3vgb5v1k8bcuhaa5fb8rer4q.apps.googleusercontent.com',
    iosBundleId: 'com.example.fePandaUnair',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZ6haAd_p8GNRzzUY8fn0YffkJSnkukzY',
    appId: '1:733280171641:web:9d7c54a38c15f55851c6a8',
    messagingSenderId: '733280171641',
    projectId: 'panda-mobile-unair',
    authDomain: 'panda-mobile-unair.firebaseapp.com',
    databaseURL: 'https://panda-mobile-unair-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'panda-mobile-unair.appspot.com',
    measurementId: 'G-18MT44RL8P',
  );
}
