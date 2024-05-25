import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/adapters/doneTransactionAdapter/models/done_transaction_model.dart';
import 'package:simple_plan/adapters/isar_adapter_base.dart';
import 'package:simple_plan/domain/entities/done_transaction_entity.dart';

class DoneTransactionAdapter extends IsarAdapterBase {
  static final db = IsarAdapterBase.db;

  Future<Map<int, DoneTransactionEntity>> listDoneTransactions(
      String monthKey) async {
    var doneTransactions = await db.doneTransactionModels
        .filter()
        .monthKeyEqualTo(monthKey)
        .findAll();

    return doneTransactions.toEntity();
  }

  Future<int> insertDone(DoneTransactionEntity entity) async {
    var model = DoneTransactionModel.fromEntity(entity);

    return await db.doneTransactionModels.put(model);
  }

  Future<void> toggleDoneValue(String monthKey, int transactionId) async {
    var doneTransaction = (await db.doneTransactionModels
            .filter()
            .monthKeyEqualTo(monthKey)
            .and()
            .transactionIdEqualTo(transactionId)
            .findAll())
        .elementAt(0);

    doneTransaction.value = !doneTransaction.value;

    await db.doneTransactionModels.put(doneTransaction);
  }
}
