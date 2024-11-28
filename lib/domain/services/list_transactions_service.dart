import 'package:simple_plan/adapters/isarAdapter/doneTransactions/done_transaction_adapter.dart';
import 'package:simple_plan/adapters/isarAdapter/transactionEntries/transaction_entry_adapter.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';

class ListTransactionsService {
  final TransactionEntryAdapter transactionDb = TransactionEntryAdapter();
  final DoneTransactionAdapter doneTransactionAdapter =
      DoneTransactionAdapter();

  Future<List<TransactionEntryEntity>> execute(String monthKey) async {
    var splittedMonthKey = monthKey.split(":");
    var month = int.parse(splittedMonthKey[0]);
    var year = int.parse(splittedMonthKey[1]);
    var lowerDate = DateTime(year, month, 1);
    var upperDate = DateTime(year, month + 1,
        0); // month + 1 -> this way, we can get the last day of month

    var transactionsEntities =
        await transactionDb.listTransactions(lowerDate, upperDate);

    var doneTransactions =
        await doneTransactionAdapter.listDoneTransactions(monthKey);

    for (var element in transactionsEntities) {
      if (element.id == null) {
        continue;
      }

      element.done = doneTransactions[element.id!]?.value ?? false;
    }

    return transactionsEntities;
  }
}
