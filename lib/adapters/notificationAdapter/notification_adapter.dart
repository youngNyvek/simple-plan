import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationAdapter {
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static late NotificationDetails notificationDetails;

  static const AndroidNotificationDetails _dueDateNotification =
      AndroidNotificationDetails('due_date_notification', 'Pagamentos a vencer',
          channelDescription:
              'Lembrete para a realização dos pagamentos cadastrados no app',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'due_date_notification');

  static const AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('splash_icon');

  static Future<void> initialize() async {
    notificationDetails =
        const NotificationDetails(android: _dueDateNotification);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(android: _initializationSettingsAndroid));

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  // static Future<void> showNotification() async {
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'plain title', 'plain body', notificationDetails,
  //       payload: 'item x');
  // }

  static Future<void> scheduleNotification(DateTime dueDate) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Alguns pagamentos vencem hoje!',
        'Entre no app e veja',
        tz.TZDateTime(tz.local, dueDate.year, dueDate.month, dueDate.day, 6),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
