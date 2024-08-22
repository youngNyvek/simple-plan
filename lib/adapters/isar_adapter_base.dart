import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/adapters/categorieAdapter/models/category_model.dart';
import 'package:simple_plan/adapters/doneTransactionAdapter/models/done_transaction_model.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/transaction_entry_model.dart';

class IsarAdapterBase {
  static late Isar db;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      DoneTransactionModelSchema,
      TransactionEntryModelSchema,
      CategoryModelSchema
    ], directory: dir.path);
  }

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    return await db.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    await db.writeTxn<void>(function);
  }
}
