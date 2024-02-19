import 'package:simple_plan/domain/entities/transaction_entry_entity.dart';

class TransactionEntryModel {
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

  static const List<String> _defaultCategories = [];

  TransactionEntryModel({
    required this.description,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    required this.monthlyPlanId,
    this.categories = _defaultCategories,
    this.finishDate,
    this.currentInstallment,
    this.finalInstallment,
  });

  factory TransactionEntryModel.fromEntity(
      TransactionEntryEntity entity, int referenceMonth, int referenceYear) {
    final referenceDate = DateTime(referenceYear, referenceMonth);

    int? finalInstallment;
    int? currentInstallment;
    double amount = entity.amount;

    if (entity.finishDate != null) {
      final startDate = DateTime(entity.startDate.year, entity.startDate.month);

      currentInstallment = _calculateInstallment(referenceDate, startDate);
      finalInstallment = _calculateInstallment(entity.finishDate!, startDate);

      amount = amount / finalInstallment;
    }

    return TransactionEntryModel(
        description: entity.description,
        amount: amount,
        startDate: entity.startDate,
        occurrenceType: entity.occurrenceType,
        done: entity.done,
        finishDate: entity.finishDate,
        monthlyPlanId: entity.monthlyPlanId,
        currentInstallment: currentInstallment,
        finalInstallment: finalInstallment);
  }

  static int _calculateInstallment(DateTime futureDate, DateTime pastDate) {
    return futureDate.difference(pastDate).inDays ~/ 30;
  }
}
