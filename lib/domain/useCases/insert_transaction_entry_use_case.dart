import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';

class InsertTransactionEntryUseCase {
  final DynamicTransactionEntryAdapter transactionDb =
      DynamicTransactionEntryAdapter();

  Future<void> execute(TransactionEntryEntity entity) async {
    await transactionDb.executeInTransaction(() async {
      await transactionDb.insertTransaction(entity);
    });
  }
}
