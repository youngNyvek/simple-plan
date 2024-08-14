import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_plan/adapters/isar_adapter_base.dart';
import 'package:simple_plan/presentation/screens/addTransaction/index.dart';
import 'package:simple_plan/presentation/screens/home/index.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarAdapterBase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'Simple Plan',
      theme: ThemeData(
          scaffoldBackgroundColor: ThemeColors.dark,
          textTheme: GoogleFonts.poppinsTextTheme()),
      routes: {
        '/': (context) => const Home(),
        '/addTransaction': (context) => const AddTransaction(),
      },
    );
  }
}
