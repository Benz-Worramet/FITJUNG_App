import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Home.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAwAc6GtGsilfIL0BuWWmTo_Y8mmaoacZE',
              appId: '1:965082785730:android:143dee5b8e0967700a985b',
              messagingSenderId: '965082785730',
              projectId: 'fitjungapplication'))
      : await Firebase.initializeApp();
  runApp(Fitjung());
}

class Fitjung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "FITJUNG", home: HomeScreen());
  }
}
