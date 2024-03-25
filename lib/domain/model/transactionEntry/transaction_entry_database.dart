import 'package:isar/isar.dart';
import 'package:simple_plan/domain/model/transactionEntry/transaction_entry_model.dart';
import 'package:path_provider/path_provider.dart';

class TransactionEntryDataBase {
  static late Isar isar;

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    return await isar.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    await isar.writeTxn<void>(() async {
      await function();
    });
  }

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
    return isar.transactionEntryModels
        .filter()
        .monthlyPlanIdEqualTo(monthKey)
        .findAll();
  }
}
