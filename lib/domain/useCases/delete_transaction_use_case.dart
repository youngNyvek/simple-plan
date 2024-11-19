import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/enums/delete_type.dart';
import 'package:simple_plan/domain/enums/recurrence_type.dart';

class DeleteTransactionUseCase {
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();

  Future<void> execute(
      String monthKey, int transactionId, int deleteType) async {
    var transactionEntity = await transactionDb.getTransaction(transactionId);

    if (transactionEntity == null) return;

    await transactionDb.executeInTransaction(() async {
      if (transactionEntity.recurrenceType == RecurrenceType.none.id ||
          transactionEntity.recurrenceType == RecurrenceType.installment.id) {
        await transactionDb.deleteTransaction(transactionId);
      } else {
        if (deleteType == DeleteType.ocurrence.id) {
          await transactionDb.addExcludedMonth(transactionId, monthKey);
        } else if (deleteType == DeleteType.serie.id) {
          if (transactionEntity.recurrenceType == RecurrenceType.every.id) {
            var transactionDueDate = transactionEntity.dueDate;
            var splittedMonthKey = monthKey.split(":");
            var month = int.parse(splittedMonthKey[0]);
            var year = int.parse(splittedMonthKey[0]);

            var isntFirstDueDate = transactionDueDate.month != month &&
                transactionDueDate.year != year;

            if (isntFirstDueDate) {
              await transactionDb.addFinalDate(transactionId, monthKey);
            } else {
              await transactionDb.deleteTransaction(transactionId);
            }
          }
        }
      }
    });
  }
}
