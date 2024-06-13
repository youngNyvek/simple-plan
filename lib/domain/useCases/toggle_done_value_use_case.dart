import 'package:simple_plan/adapters/doneTransactionAdapter/done_transaction_adapter.dart';

class ToggleDoneValueUseCase {
  final DoneTransactionAdapter _doneTransactionDb = DoneTransactionAdapter();

  Future<void> execute(String monthKey, int transactionId) async {
    await _doneTransactionDb.executeInTransaction(() async {
      await _doneTransactionDb.toggleDoneValue(monthKey, transactionId);
    });
  }
}
