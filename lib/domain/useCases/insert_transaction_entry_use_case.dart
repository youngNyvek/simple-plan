import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';

class InsertTransactionEntryUseCase {
  final DynamicTransactionEntryAdapter transactionDb =
      DynamicTransactionEntryAdapter();

  Future<void> execute(TransactionEntryEntity entity) async {
    transactionDb.executeInTransaction(() async {
      if (entity.recurrenceType != RecurrenceType.none.id) {
        await transactionDb.insertFixed(entity);
      } else {
        await transactionDb.insertDynamic(entity);
      }
    });
  }
}
