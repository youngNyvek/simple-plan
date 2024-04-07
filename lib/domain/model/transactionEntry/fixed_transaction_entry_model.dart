import 'package:isar/isar.dart';

part 'fixed_transaction_entry_model.g.dart';

const List<String> _defaultCategories = ["CUSTO FIXO", "LAZER", "SAÚDE"];

@Collection()
class FixedTransactionEntryModel {
  Id id = Isar.autoIncrement;
  final String description;
  final double amount;
  final DateTime startDate;
  final int occurrenceType;
  final DateTime? finishDate;
  final List<String> categories;

  FixedTransactionEntryModel(
      {required this.description,
      required this.amount,
      required this.startDate,
      required this.occurrenceType,
      required this.categories,
      this.finishDate});

  @override
  String toString() {
    return 'DynamicTransactionEntryModel{id: $id, description: $description, amount: $amount, startDate: $startDate, occurrenceType: $occurrenceType, finishDate: $finishDate,  categories: $categories}';
  }
}
