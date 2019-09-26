import 'package:flutter/material.dart';
import './ui_pages/splash.dart';
import './ui_pages//login.dart';
import './queue_ui.dart';
import './patient_ui.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => MyHomePage(),
         '/queuelist': (BuildContext context) => Home(),
           '/patient': (BuildContext context) => PatientUI(),
      },
      home:  SplashScreen(),
    );
  }
}

