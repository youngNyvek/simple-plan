import 'package:isar/isar.dart';

part 'transaction_entry_model.g.dart';

const List<String> _defaultCategories = ["CUSTO FIXO", "LAZER", "SAÚDE"];

@Collection()
class TransactionEntryModel {
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

  TransactionEntryModel({
    required this.description,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    required this.monthlyPlanId,
    required this.categories,
    this.finishDate,
    this.currentInstallment,
    this.finalInstallment,
  });
}
