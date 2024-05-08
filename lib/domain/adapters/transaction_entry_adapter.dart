import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/domain/model/transactionEntry/dynamic_transaction_entry_model.dart';
import 'package:simple_plan/domain/model/transactionEntry/fixed_transaction_entry_model.dart';

class DynamicTransactionEntryAdapter {
  static late Isar db;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open(
        [DynamicTransactionEntryModelSchema, FixedTransactionEntryModelSchema],
        directory: dir.path);
  }

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    return await db.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    await db.writeTxn<void>(() async {
      await function();
    });
  }

  Future<void> insertDynamic(DynamicTransactionEntryModel model) async {
    await db.dynamicTransactionEntryModels.put(model);
  }

  Future<int> insertFixed(FixedTransactionEntryModel model) async {
    return await db.fixedTransactionEntryModels.put(model);
  }

  Future<List<DynamicTransactionEntryModel>> listDynamics(
      String monthKey) async {
    return db.dynamicTransactionEntryModels
        .filter()
        .monthlyPlanIdEqualTo(monthKey)
        .findAll();
  }

  Future<List<FixedTransactionEntryModel>> listFixeds(String monthKey) async {
    return db.fixedTransactionEntryModels
        .filter()
        .finishDateIsNotNull()
        .findAll();
  }
}
