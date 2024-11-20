import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class PushNotificationAdapter {
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

  static Future<void> scheduleNotification(
      DateTime dueDate, String title, String body) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime(tz.local, dueDate.year, dueDate.month, dueDate.day, 6),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future<void> scheduleDefaultNotifications(DateTime notifyDate) async {
    var currentDate = DateTime.now();
    var dateDiff = notifyDate.difference(currentDate);

    if (dateDiff.inDays >= 3) {
      PushNotificationAdapter.scheduleNotification(
          notifyDate.add(const Duration(days: -3)),
          'Não se esqueça',
          'Alguns pagamentos vencem daqui a 3 dias!');
    }

    PushNotificationAdapter.scheduleNotification(
        notifyDate, 'Alguns pagamentos vencem hoje!', 'Entre no app e veja');
  }
}
