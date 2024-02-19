class TransactionEntryEntity {
  final int? id;
  final String description;
  final double amount;
  final DateTime createdAt;
  final DateTime startDate;
  final int occurrenceType;
  final bool done;
  final String monthlyPlanId;
  final DateTime? finishDate;
  final DateTime? updatedAt;

  const TransactionEntryEntity({
    this.id,
    required this.description,
    required this.createdAt,
    required this.amount,
    required this.startDate,
    required this.occurrenceType,
    required this.done,
    required this.monthlyPlanId,
    this.updatedAt,
    this.finishDate,
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
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return 'TransactionEntryEntity{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, done: $done, description: $description, amount: $amount, startDate: $startDate, occurrenceType: $occurrenceType, finishDate: $finishDate, monthlyPlanId: $monthlyPlanId}';
  }
}
