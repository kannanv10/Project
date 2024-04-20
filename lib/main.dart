// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:trail2/Pages/firstpage.dart';
import 'package:trail2/Pages/CalculationPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/login/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyDSSIBsrEztVBv4DiP8OTFJxh7F1degUNY",
          appId: "1:778925904779:android:4e7786eb5d68009a17158e",
          messagingSenderId: "778925904779",
          projectId:"flutter-d8e01",
          databaseURL: "https://flutter-d8e01-default-rtdb.firebaseio.com/")
  );
  await FirebaseMessaging.instance.subscribeToTopic("sample");
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primarySwatch: Colors.blue
  ,
      ),
      home: LoginScreen()
    );
  }
}

