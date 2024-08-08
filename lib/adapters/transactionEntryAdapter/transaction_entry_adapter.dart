import 'package:isar/isar.dart';
import 'package:simple_plan/adapters/isar_adapter_base.dart';
import 'package:simple_plan/adapters/transactionEntryAdapter/models/transaction_entry_model.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';
import 'package:simple_plan/domain/shared/enum/recurrence_type.dart';
import 'package:simple_plan/domain/shared/utils/string_utils.dart';

class TransactionEntryAdapter extends IsarAdapterBase {
  static final db = IsarAdapterBase.db;

  Future<int> insertTransaction(TransactionEntryEntity entity) async {
    var model = TransactionEntryModel.fromEntity(entity);

    return await db.transactionEntryModels.put(model);
  }

  Future<List<TransactionEntryEntity>> listTransactions(
      DateTime lowerDate, DateTime upperDate) async {
    var monthKey = StringUtils.getMonthKey(lowerDate);
    var transactions = await db.transactionEntryModels
        .filter()
        .not()
        .excludedMonthsElementContains(monthKey)
        .and()
        .group((q) => q
            .recurrenceTypeEqualTo(RecurrenceType.every.id)
            .and()
            .group((q) => q
                .dueDateBetween(lowerDate, upperDate)
                .or()
                .dueDateLessThan(upperDate)
                .or()
                .dueDateEqualTo(upperDate))
            .and()
            .group((q) =>
                q.finalDateGreaterThan(upperDate).or().finalDateIsNull()))
        .or()
        .group((q) => q
            .recurrenceTypeEqualTo(RecurrenceType.installment.id)
            .and()
            .group((q) => q
                .dueDateLessThan(lowerDate)
                .or()
                .dueDateBetween(lowerDate, upperDate))
            .and()
            .group(
                (q) => q.finalDateBetween(lowerDate, upperDate).or().finalDateGreaterThan(upperDate)))
        .or()
        .group((q) => q.recurrenceTypeEqualTo(RecurrenceType.none.id).and().dueDateBetween(lowerDate, upperDate))
        .findAll();

    return transactions.toEntity();
  }

  Future<void> deleteTransaction(int id) async {
    await db.transactionEntryModels.deleteAll([id]);
  }

  Future<void> addExcludedMonth(int transactionId, String monthKey) async {
    var transactionEntryModel =
        await db.transactionEntryModels.get(transactionId);

    if (transactionEntryModel == null) {
      return;
    }

    TransactionEntryModel newTransactionEntryModel;

    if (transactionEntryModel.excludedMonths != null) {
      newTransactionEntryModel = transactionEntryModel
        ..excludedMonths =
            {...transactionEntryModel.excludedMonths!, monthKey}.toList();
    } else {
      newTransactionEntryModel = transactionEntryModel
        ..excludedMonths = [monthKey];
    }

    await db.transactionEntryModels.put(newTransactionEntryModel);
  }

  Future<void> addFinalDate(int transactionId, String monthKey) async {
    var transactionEntryModel =
        await db.transactionEntryModels.get(transactionId);

    if (transactionEntryModel == null) {
      return;
    }

    transactionEntryModel.finalDate = StringUtils.getDateFromMonthKey(monthKey);

    await db.transactionEntryModels.put(transactionEntryModel);
  }

  Future<TransactionEntryEntity?> getTransaction(int transactionId) async {
    var model = await db.transactionEntryModels.get(transactionId);

    return model?.toEntity();
  }
}
