import 'package:simple_plan/adapters/doneTransactionAdapter/done_transaction_adapter.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';

class InsertOrUpdateTransactionEntryUseCase {
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();
  final DoneTransactionAdapter doneTransactionDb = DoneTransactionAdapter();

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
    });
  }
}
