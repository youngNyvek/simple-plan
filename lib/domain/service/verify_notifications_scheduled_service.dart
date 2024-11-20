import 'dart:developer';

import 'package:simple_plan/adapters/pushNotificationAdapter/push_notification_adapter.dart';
import 'package:simple_plan/adapters/scheduledNotificationAdapter/scheduled_notification_adapter.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/domain/shared/utils/date_utils.dart';

class VerifyNotificationsScheduledService {
  final ScheduledNotificationAdapter _scheduledNotificationAdapter =
      ScheduledNotificationAdapter();

  final TransactionEntryAdapter _transactionEntryAdapter =
      TransactionEntryAdapter();

  Future<void> execute() async {
    log("executou cron");
    var notifications = await _scheduledNotificationAdapter.listNotifications();

    if (notifications.isEmpty) return;

    var currentDate = DateTime.now();
    var nextMonth = DateTime(currentDate.year, currentDate.month + 1, 1);

    var (lowerDate, upperDate) = DateUtils.getMonthBoundariesByDate(nextMonth);

    var expenses =
        (await _transactionEntryAdapter.listTransactions(lowerDate, upperDate))
            .where((t) => t.occurrenceType == OccurrenceType.expense.id);

    var notificationsToDelete = List<int>.empty();

    for (var notification in notifications) {
      var needNotification = false;

      for (var expense in expenses) {
        var dueDay = expense.dueDate.day;

        if (notification.notificationDay == dueDay) {
          needNotification = true;
          break;
        }
      }

      if (needNotification) {
        var notifyDate = DateTime(
            currentDate.year, currentDate.month, notification.notificationDay);

        PushNotificationAdapter.scheduleDefaultNotifications(notifyDate);
      } else {
        notificationsToDelete.add(notification.id!);
      }
    }

    if (notificationsToDelete.isNotEmpty) {
      await _scheduledNotificationAdapter
          .deleteNotification(notificationsToDelete);
    }
  }
}
