class TransactionEntryEntity {
  final int? id;
  final String description;
  final double amount;
  final DateTime dueDate;
  final int occurrenceType;
  final bool done;
  late final DateTime? finalDate;
  final int? installment;
  final List<String> categories;
  final int recurrenceType;

  TransactionEntryEntity({
    required this.description,
    required this.amount,
    required this.dueDate,
    required this.occurrenceType,
    required this.done,
    required this.categories,
    required this.recurrenceType,
    this.finalDate,
    this.id,
    this.installment,
  }) {
    if (installment != null && finalDate == null) {
      finalDate =
          DateTime(dueDate.year, dueDate.month + installment!, dueDate.day);
    }
  }
}
