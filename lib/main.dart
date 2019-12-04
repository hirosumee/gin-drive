import 'package:flutter/material.dart';
import 'package:flutter_app/constants/Constant.dart';
import 'package:flutter_app/screens/LoginScreen.dart';
import 'package:flutter_app/screens/RegisterScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          textTheme: TextTheme(
              body1: TextStyle(color: Colors.blue, fontSize: 18.0),
              button: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              display1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue))),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen()
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
    );
  }
}
