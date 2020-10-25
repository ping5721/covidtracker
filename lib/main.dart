import 'package:covid/screen/loginscreen.dart';
import 'package:covid/screen/thaidashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'covid-tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => Loginscreen(),
        '/dashboard': (context) => Dashboard()
      },
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Color(0xffd9354f),
        visualDensity: VisualDensity.comfortable,
      ),
    ),
  );
}
