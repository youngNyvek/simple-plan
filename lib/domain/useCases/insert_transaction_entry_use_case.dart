import 'package:simple_plan/adapters/doneTransactionAdapter/done_transaction_adapter.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';

class InsertOrUpdateTransactionEntryUseCase {
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();
  final DoneTransactionAdapter doneTransactionDb = DoneTransactionAdapter();

  Future<void> execute(TransactionEntryEntity entity) async {
    await transactionDb.executeInTransaction(() async {
      await transactionDb.insertTransaction(entity);
    });
  }
}
