import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/transaction_entry_model.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';

class DynamicTransactionEntryAdapter {
  static late Isar db;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([TransactionEntryModelSchema], directory: dir.path);
  }

  Future<T> executeInTransactionWithResult<T>(
      Future<T> Function() function) async {
    return await db.writeTxn(function);
  }

  Future<void> executeInTransaction(Future<void> Function() function) async {
    await db.writeTxn<void>(function);
  }

  Future<int> insertTransaction(TransactionEntryEntity entity) async {
    var model = TransactionEntryModel.fromEntity(entity);

    return await db.transactionEntryModels.put(model);
  }

  Future<List<TransactionEntryEntity>> listTransactions(
      DateTime lowerDate, DateTime upperDate) async {
    var transactions = await db.transactionEntryModels
        .filter()
        .group((q) => q
            .recurrenceTypeEqualTo(RecurrenceType.every.id)
            .and()
            .finalDateIsNull())
        .or()
        .group((q) => q
            .recurrenceTypeEqualTo(RecurrenceType.installment.id)
            .and()
            .finalDateEqualTo(upperDate)
            .or()
            .finalDateGreaterThan(upperDate))
        .or()
        .group((q) => q
            .recurrenceTypeEqualTo(RecurrenceType.none.id)
            .and()
            .dueDateBetween(lowerDate, upperDate))
        .findAll();

    return transactions.toEntity();
  }
}
