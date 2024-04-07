import 'package:isar/isar.dart';
import 'package:simple_plan/domain/model/transactionEntry/fixed_transaction_entry_model.dart';

part 'dynamic_transaction_entry_model.g.dart';

const List<String> _defaultCategories = ["CUSTO FIXO", "LAZER", "SAÚDE"];

@Collection()
class DynamicTransactionEntryModel {
  Id id = Isar.autoIncrement;
  final String description;
  final double amount;
  final DateTime startDate;
  final int occurrenceType;
  final bool done;
  final DateTime? finishDate;
  final String monthlyPlanId;
  final int? currentInstallment;
  final int? finalInstallment;
  final List<String> categories;
  final int recurrenceType;
  final int? transactionBaseId;
  late final int? fixedTransactionId;

  DynamicTransactionEntryModel({
    required this.description,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    required this.monthlyPlanId,
    required this.categories,
    required this.recurrenceType,
    this.finishDate,
    this.currentInstallment,
    this.finalInstallment,
    this.transactionBaseId,
    this.fixedTransactionId,
  });

  FixedTransactionEntryModel toFixedEntry() {
    return FixedTransactionEntryModel(
        description: description,
        amount: amount,
        startDate: startDate,
        occurrenceType: occurrenceType,
        categories: categories);
  }

  @override
  String toString() {
    return 'DynamicTransactionEntryModel{id: $id, description: $description, amount: $amount, startDate: $startDate, occurrenceType: $occurrenceType, done: $done, finishDate: $finishDate, monthlyPlanId: $monthlyPlanId, currentInstallment: $currentInstallment, finalInstallment: $finalInstallment, categories: $categories}';
  }
}
