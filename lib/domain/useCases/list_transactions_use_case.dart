import 'package:simple_plan/adapters/transactionEntryAdapter/transaction_entry_adapter.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/dynamic_transaction_entry_model.dart';

class ListTransactionsUseCase {
  final DynamicTransactionEntryAdapter transactionDb =
      DynamicTransactionEntryAdapter();

  Future<List<DynamicTransactionEntryModel>> execute(String monthlyId) async {
    var splittedMontlyId = monthlyId.split(":");
    var month = int.parse(splittedMontlyId[0]);
    var year = int.parse(splittedMontlyId[1]);
    var lowerDate = DateTime(year, month, 1);
    var upperDate = DateTime(
        year, month + 1, 0); // this way, we can get the last day of month

    return transactionDb.listDynamics(lowerDate, upperDate);
  }
}
