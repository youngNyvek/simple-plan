import 'package:flutter/material.dart';
import 'package:simple_plan/screens/home.dart';
import 'package:simple_plan/utils/theme_Colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Plan',
      theme: ThemeData(scaffoldBackgroundColor: ThemeColors.darkBlue),
      home: const Home(),
    );
  }
}
