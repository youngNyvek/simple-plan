import 'package:flutter/material.dart';
import 'package:simple_plan/screens/add_plan/add_plan.dart';
import 'package:simple_plan/screens/home/home.dart';
import 'package:simple_plan/shared/utils/theme_colors.dart';

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
      routes: {
        '/': (context) => const Home(),
        '/addPlan': (context) => const AddPlan()
      },
    );
  }
}
