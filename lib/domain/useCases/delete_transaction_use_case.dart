import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';
import 'package:simple_plan/domain/shared/enum/delete_type.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';

class DeleteTransactionUseCase {
  final DynamicTransactionEntryAdapter transactionDb =
      DynamicTransactionEntryAdapter();

  Future<void> execute(
      String monthKey, int transactionId, int deleteType) async {
    var transactionEntity = await transactionDb.getTransaction(transactionId);

    if (transactionEntity == null) return;

    await transactionDb.executeInTransaction(() async {
      if (transactionEntity.recurrenceType == RecurrenceType.none.id) {
        await transactionDb.deleteTransaction(transactionId);
      } else {
        if (deleteType == DeleteType.ocurrence.id) {
          await transactionDb.addExcludedMonth(transactionId, monthKey);
        } else if (deleteType == DeleteType.serie.id) {
          await transactionDb.deleteTransaction(transactionId);
        }
      }
    });
  }
}
