// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:trail2/Pages/firstpage.dart';
import 'package:trail2/Pages/CalculationPage.dart';

import 'Pages/login/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*void initializeData() {
    Secrets.AUTH_TOKEN = UserSessionDetails.getToken();
    UserSessionDetails.initHive()
        .whenComplete(() => Secrets.AUTH_TOKEN = UserSessionDetails.getToken());
  }*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // initializeData();
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
      //home: if(UserSessionDetails.prefs.get("isUserAlreadyLoggedIn")) ? GOtpage2 : LoginScreen()
      home: LoginScreen()
    );
  }
}
