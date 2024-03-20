import 'package:isar/isar.dart';
import 'package:simple_plan/domain/model/transactionEntry/transaction_entry_model.dart';
import 'package:path_provider/path_provider.dart';

class TransactionEntryDataBase {
  static late Isar isar;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = (await Isar.open(
      [TransactionEntryModelSchema],
      directory: dir.path,
    ));
  }

  Future<void> insert(TransactionEntryModel model) async {
    await isar.writeTxn(() => isar.transactionEntryModels.put(model));
  }

  Future<List<TransactionEntryModel>> list(String monthKey) async {
    return await isar.txn(() => isar.transactionEntryModels
        .filter()
        .monthlyPlanIdEqualTo(monthKey)
        .findAll());
  }
}
