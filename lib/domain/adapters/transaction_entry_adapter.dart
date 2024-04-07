import 'package:isar/isar.dart';
import 'package:simple_plan/domain/adapters/isar_initializer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/domain/model/transactionEntry/dynamic_transaction_entry_model.dart';
import 'package:simple_plan/domain/model/transactionEntry/fixed_transaction_entry_model.dart';

class DynamicTransactionEntryAdapter extends IsarInstance {
  DynamicTransactionEntryAdapter()
      : super(schemas: [
          DynamicTransactionEntryModelSchema,
          FixedTransactionEntryModelSchema
        ]);

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    var db = await isar;

    return await db.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    var db = await isar;

    await db.writeTxn<void>(() async {
      await function();
    });
  }

  Future<void> insert(DynamicTransactionEntryModel model) async {
    var db = await isar;

    await db.dynamicTransactionEntryModels.put(model);
  }

  Future<List<DynamicTransactionEntryModel>> listDynamics(
      String monthKey) async {
    var db = await isar;

    return db.dynamicTransactionEntryModels
        .filter()
        .monthlyPlanIdEqualTo(monthKey)
        .findAll();
  }

  Future<List<FixedTransactionEntryModel>> listFixeds(String monthKey) async {
    var db = await isar;

    return db.fixedTransactionEntryModels
        .filter()
        .finishDateIsNotNull()
        .findAll();
  }
}
