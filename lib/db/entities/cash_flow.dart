class CashFlow {
  final int? id;
  final String description;
  final double value;
  final DateTime startDate;
  final int occurrence;
  final DateTime? finishDate;
  final int? parcel;
  final int? firstParcelId;
  final String monthlyPlanId;

  const CashFlow({
    this.id,
    required this.description,
    required this.value,
    required this.startDate,
    required this.occurrence,
    this.finishDate,
    this.parcel,
    this.firstParcelId,
    required this.monthlyPlanId,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'description': description,
      'value': value,
      'startDate': startDate,
      'occurrence': occurrence,
      'finishDate': finishDate,
      'parcel': parcel,
      'firstParcelId': firstParcelId,
      'monthlyPlanId': monthlyPlanId,
    };
  }

  @override
  String toString() {
    return 'CashFlow{id: $id, description: $description, value: $value, startDate: $startDate, occurrence: $occurrence, finishDate: $finishDate, parcel: $parcel, firstParcelId: $firstParcelId, monthlyPlanId: $monthlyPlanId}';
  }
}
