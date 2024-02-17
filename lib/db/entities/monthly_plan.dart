class MonthlyPlan {
  final String id;

  const MonthlyPlan({required this.id});

  Map<String, Object?> toMap() {
    return {
      'id': id,
    };
  }

  @override
  String toString() {
    return 'MonthlyPlan{id: $id}';
  }
}
