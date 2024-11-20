import 'package:simple_plan/adapters/doneTransactionAdapter/done_transaction_adapter.dart';
import 'package:simple_plan/adapters/pushNotificationAdapter/push_notification_adapter.dart';
import 'package:simple_plan/adapters/scheduledNotificationAdapter/scheduled_notification_adapter.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/notification_entity.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/enums/occurence_type.dart';

class InsertOrUpdateTransactionEntryUseCase {
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();
  final DoneTransactionAdapter doneTransactionDb = DoneTransactionAdapter();
  final ScheduledNotificationAdapter scheduledNotificationAdapter =
      ScheduledNotificationAdapter();

  Future<void> execute(TransactionEntryEntity entity) async {
    var currentDateTime = DateTime.now();
    var currentDate = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);

    var monthKey = "${entity.dueDate.month}:${entity.dueDate.year}";

    await transactionDb.executeInTransaction(() async {
      int transactionId;

      if (entity.id != null) {
        await transactionDb.addFinalDate(entity.id!, monthKey);

        var newEntity = TransactionEntryEntity(
            excludedMonths: entity.excludedMonths,
            installment: entity.installment,
            description: entity.description,
            amount: entity.amount,
            dueDate: entity.dueDate,
            occurrenceType: entity.occurrenceType,
            done: entity.done,
            categories: entity.categories,
            recurrenceType: entity.recurrenceType);

        transactionId = await transactionDb.insertTransaction(newEntity);
      } else {
        transactionId = await transactionDb.insertTransaction(entity);
      }

      if (entity.dueDate == currentDate) {
        await doneTransactionDb.toggleDoneValue(monthKey, transactionId);
      }

      if (entity.occurrenceType == OccurrenceType.expense.id) {
        await PushNotificationAdapter.scheduleDefaultNotifications(
            entity.dueDate);

        var notificationEntity =
            ScheduledNotificationEntity(notificationDay: entity.dueDate.day);
        await scheduledNotificationAdapter
            .insertNotification(notificationEntity);
      }
    });
  }
}
