import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_plan/presentation/screens/home/index.dart';
import 'package:simple_plan/domain/shared/utils/theme_colors.dart';

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
      theme: ThemeData(
          scaffoldBackgroundColor: ThemeColors.dark,
          textTheme: GoogleFonts.poppinsTextTheme()),
      routes: {
        '/': (context) => const Home(),
        '/addPlan': (context) => const Home()
      },
    );
  }
}
