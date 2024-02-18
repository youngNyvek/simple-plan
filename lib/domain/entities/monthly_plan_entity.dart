class MonthlyPlanEntity {
  final String id;

  const MonthlyPlanEntity({required this.id});

  Map<String, Object?> toMap() {
    return {
      'id': id,
    };
  }

  @override
  String toString() {
    return 'MonthlyPlanEntity{id: $id}';
  }
}
