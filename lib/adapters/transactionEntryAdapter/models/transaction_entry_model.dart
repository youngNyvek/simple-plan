import 'package:isar/isar.dart';
import 'package:simple_plan/domain/entities/transaction_entry_entitie.dart';

part 'transaction_entry_model.g.dart';

const List<String> _defaultCategories = ["CUSTO FIXO", "LAZER", "SAÚDE"];

@Collection()
class TransactionEntryModel {
  Id id = Isar.autoIncrement;
  final DateTime? finalDate;
  final int? installment;
  final String description;
  final double amount;
  final DateTime dueDate;
  final int occurrenceType;
  final bool done;
  final List<String> categories;
  final int recurrenceType;

  TransactionEntryModel(
      this.installment,
      this.description,
      this.amount,
      this.dueDate,
      this.occurrenceType,
      this.done,
      this.categories,
      this.recurrenceType,
      this.finalDate);

  TransactionEntryModel.fromEntity(TransactionEntryEntity entity)
      : finalDate = entity.finalDate,
        installment = entity.installment,
        description = entity.description,
        amount = entity.amount,
        dueDate = entity.dueDate,
        occurrenceType = entity.occurrenceType,
        done = entity.done,
        categories = entity.categories,
        recurrenceType = entity.recurrenceType;

  TransactionEntryEntity toEntity() {
    return TransactionEntryEntity(
        id: id,
        installment: installment,
        description: description,
        amount: amount,
        dueDate: dueDate,
        occurrenceType: occurrenceType,
        done: done,
        categories: categories,
        recurrenceType: recurrenceType,
        finalDate: finalDate);
  }

  @override
  String toString() {
    return 'DynamicTransactionEntryModel{id: $id, description: $description, amount: $amount, occurrenceType: $occurrenceType, finishDate: $finalDate,  categories: $categories}';
  }
}

extension MapTransactionEntity on List<TransactionEntryModel> {
  List<TransactionEntryEntity> toEntity() {
    return map((e) => e.toEntity()).toList();
  }
}
