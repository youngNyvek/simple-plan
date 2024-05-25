import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/adapters/doneTransactionAdapter/models/done_transaction_model.dart';
import 'package:simple_plan/domain/entities/done_transaction_Entity.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

class DoneTransactionAdapter {
  static late Isar db;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([DoneTransactionModelSchema], directory: dir.path);
  }

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    return await db.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    await db.writeTxn<void>(function);
  }

  Future<Map<int, DoneTransactionEntity>> listDoneTransactions(
      String monthKey) async {
    var doneTransactions = await db.doneTransactionModels
        .filter()
        .monthKeyEqualTo(monthKey)
        .findAll();

    return doneTransactions.toEntity();
  }
}
