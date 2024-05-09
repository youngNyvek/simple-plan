class TransactionEntryEntity {
  final int? id;
  final String description;
  final double amount;
  final DateTime startDate;
  final int occurrenceType;
  final bool done;
  final DateTime? finishDate;
  final int? currentInstallment;
  final int? finalInstallment;
  final List<String> categories;
  final int recurrenceType;
  final int? transactionBaseId;
  late int? fixedTransactionId;

  TransactionEntryEntity({
    required this.description,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    required this.categories,
    required this.recurrenceType,
    this.id,
    this.finishDate,
    this.currentInstallment,
    this.finalInstallment,
    this.transactionBaseId,
    this.fixedTransactionId,
  });
}
