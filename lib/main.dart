import 'package:cron/cron.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_plan/adapters/firebaseAuthAdapter/index.dart';
import 'package:simple_plan/adapters/firestoreAdapter/firestore_adapter_base.dart';
import 'package:simple_plan/adapters/isarAdapter/isar_adapter_base.dart';
import 'package:simple_plan/adapters/isarAdapter/pushNotifications/push_notification_adapter.dart';
import 'package:simple_plan/domain/services/verify_notifications_scheduled_service.dart';
import 'package:simple_plan/firebase_options.dart';
import 'package:simple_plan/presentation/screens/addTransaction/index.dart';
import 'package:simple_plan/presentation/screens/home/index.dart';
import 'package:simple_plan/presentation/constants/theme_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarAdapterBase.initialize();
  await PushNotificationAdapter.initialize();
  // await FirestoreAdapterBase.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final cron = Cron();
  final verifyNotificationsScheduledService =
      VerifyNotificationsScheduledService();

  cron.schedule(Schedule.parse('0 0 28 * *'),
      verifyNotificationsScheduledService.execute);

  FirebaseAuthAdapter.login();

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
