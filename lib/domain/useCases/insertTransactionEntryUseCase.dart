import 'package:simple_plan/domain/model/transactionEntry/transaction_entry_database.dart';
import 'package:simple_plan/domain/model/transactionEntry/transaction_entry_model.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';

class InsertTransactionEntryUseCase {
  final TransactionEntryDataBase transactionDb = TransactionEntryDataBase();

  Future<void> execute(TransactionEntryModel model) async {
    transactionDb.executeInTransaction(() async {
      if (model.recurrenceType == RecurrenceType.every.id) {
        await transactionDb.insert(model);
      }
    });
  }
}
