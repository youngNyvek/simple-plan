import 'package:simple_plan/domain/adapters/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/model/transactionEntry/dynamic_transaction_entry_model.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';

class InsertDynamicTransactionEntryUseCase {
  final DynamicTransactionEntryAdapter transactionDb =
      DynamicTransactionEntryAdapter();

  Future<void> execute(DynamicTransactionEntryModel model) async {
    transactionDb.executeInTransaction(() async {
      if (model.recurrenceType == RecurrenceType.every.id) {
        var fixedId = await transactionDb.insertFixed(model.toFixedEntry());
        model.fixedTransactionId = fixedId;
        await transactionDb.insertDynamic(model);
      } else if (model.recurrenceType == RecurrenceType.none.id) {
        await transactionDb.insertDynamic(model);
      }
    });
  }
}
