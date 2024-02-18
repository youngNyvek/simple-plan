class TransactionEntryEntity {
  final int? id;
  final String description;
  final double amount;
  final DateTime startDate;
  final int occurrenceType;
  final bool done;
  final DateTime? finishDate;
  final String monthlyPlanId;

  const TransactionEntryEntity({
    this.id,
    required this.description,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    this.finishDate,
    required this.monthlyPlanId,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'startDate': startDate,
      'occurrenceType': occurrenceType,
      'finishDate': finishDate,
      'done': done,
      'monthlyPlanId': monthlyPlanId,
    };
  }

  @override
  String toString() {
    return 'TransactionEntryEntity{id: $id, done: $done, description: $description, amount: $amount, startDate: $startDate, occurrenceType: $occurrenceType, finishDate: $finishDate, monthlyPlanId: $monthlyPlanId}';
  }
}
