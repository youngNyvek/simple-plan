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
  final double? installmentAmount;

  TransactionEntryModel(
      {required this.description,
      required this.amount,
      required this.startDate,
      required this.occurrenceType,
      required this.done,
      required this.monthlyPlanId,
      this.finishDate,
      this.currentInstallment,
      this.finalInstallment,
      this.installmentAmount});

  factory TransactionEntryModel.fromEntity(
      TransactionEntryEntity entity, int referenceMonth, int referenceYear) {
    final referenceDate = DateTime(referenceYear, referenceMonth);

    int? finalInstallment;
    int? currentInstallment;
    double? installmentAmount;

    if (entity.finishDate != null) {
      final startDate = DateTime(entity.startDate.year, entity.startDate.month);

      currentInstallment = _calculateInstallment(referenceDate, startDate);
      finalInstallment = _calculateInstallment(entity.finishDate!, startDate);
      installmentAmount = entity.amount / finalInstallment;
    }

    return TransactionEntryModel(
      description: entity.description,
      amount: entity.amount,
      startDate: entity.startDate,
      occurrenceType: entity.occurrenceType,
      done: entity.done,
      finishDate: entity.finishDate,
      monthlyPlanId: entity.monthlyPlanId,
      currentInstallment: currentInstallment,
      installmentAmount: installmentAmount,
      finalInstallment: finalInstallment,
    );
  }

  static int _calculateInstallment(DateTime leftDate, DateTime rightDate) {
    return leftDate.difference(rightDate).inDays ~/ 30;
  }
}
