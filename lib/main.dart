import 'package:flutter/material.dart';
import 'package:sanad_app/screens/splash_screen.dart';

void main() {
  runApp(SanadApp());
}

class SanadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanad App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      home: SplashScreen(),
    );
  }
}