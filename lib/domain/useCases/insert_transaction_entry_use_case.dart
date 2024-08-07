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

    await transactionDb.executeInTransaction(() async {
      var transactionId = await transactionDb.insertTransaction(entity);

      if (entity.dueDate == currentDate) {
        var monthKey = "${entity.dueDate.month}:${entity.dueDate.year}";

        await doneTransactionDb.toggleDoneValue(monthKey, transactionId);
      }
    });
  }
}
