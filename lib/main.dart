import 'package:flutter/material.dart';
import 'package:shopy/screens/home_screen.dart';
import 'package:shopy/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
