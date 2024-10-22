import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import './signInOrSignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './OTP.dart';
import './register.dart';
import './homePage.dart';
import './login_with_phone.dart';



Future<void> main() async {


    initialization();



  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'SigInOrSignUp',
    //initialRoute:'SplashScreen',
    //initialRoute:'LoginWithPhone',
    //initialRoute: 'homeScreen',
    routes: {
      'SigInOrSignUp': (context) => SigInOrSignUp(),
      //'SplashScreen': (context) => splashScreen(),
      //'LoginWithPhone': (context) => LoginWithPhone(),
      //'homeScreen': (context) => homeScreen(),
    },
  ));
}



void initialization() async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  Remove the following example because
  // delaying the user experience is a bad design practice!
  // ignore_for_file: avoid_print
  print('ready in 3...');
  await Future.delayed(const Duration(seconds: 1));
  print('ready in 2...');
  await Future.delayed(const Duration(seconds: 1));
  print('ready in 1...');
  await Future.delayed(const Duration(seconds: 1));
  print('go!');
  FlutterNativeSplash.remove();
}