import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/services/list_transactions_service.dart';

class ListTransactionsUseCase {
  final ListTransactionsService transactionsService = ListTransactionsService();

  Future<List<TransactionEntryEntity>> execute(String monthKey) async {
    var transactionsEntities = await transactionsService.execute(monthKey);

    return transactionsEntities;
  }
}
