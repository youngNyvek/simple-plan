import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/dynamic_transaction_entry_model.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/fixed_transaction_entry_model.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';

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

  Future<void> insertDynamic(TransactionEntryEntity entity) async {
    var model = DynamicTransactionEntryModel.fromEntity(entity);

    await db.dynamicTransactionEntryModels.put(model);
  }

  Future<int> insertFixed(TransactionEntryEntity entity) async {
    var model = FixedTransactionEntryModel.fromEntity(entity);

    return await db.fixedTransactionEntryModels.put(model);
  }

  Future<List<DynamicTransactionEntryModel>> listDynamics(
      DateTime lowerDate, DateTime upperDate) async {
    return db.dynamicTransactionEntryModels
        .filter()
        .startDateBetween(lowerDate, upperDate)
        .findAll();
  }

  Future<List<FixedTransactionEntryModel>> listFixeds(String monthKey) async {
    return db.fixedTransactionEntryModels
        .filter()
        .finishDateIsNotNull()
        .findAll();
  }
}
