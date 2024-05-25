import 'package:simple_plan/adapters/doneTransactionAdapter/done_transaction_adapter.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/done_transaction_entity.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

class InsertTransactionEntryUseCase {
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();
  final DoneTransactionAdapter doneTransactionDb = DoneTransactionAdapter();

  Future<void> execute(TransactionEntryEntity entity) async {
    await transactionDb.executeInTransaction(() async {
      var id = await transactionDb.insertTransaction(entity);

      var doneEntity = DoneTransactionEntity(
          monthKey: StringUtils.getMonthKey(entity.dueDate),
          transactionId: id,
          value: false);

      await doneTransactionDb.insertDone(doneEntity);
    });
  }
}
