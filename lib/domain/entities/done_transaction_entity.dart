class DoneTransactionEntity {
  final int? id;
  final String monthKey;
  final int transactionId;
  final bool value;

  DoneTransactionEntity(
      {this.id,
      required this.monthKey,
      required this.transactionId,
      required this.value});
}
