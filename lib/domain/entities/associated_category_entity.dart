class AssociatedCategoryEntity {
  final int id;
  final int categoryId;
  final int cashFlowId;

  const AssociatedCategoryEntity({
    required this.id,
    required this.categoryId,
    required this.cashFlowId,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'cashFlowId': cashFlowId,
    };
  }

  @override
  String toString() {
    return 'AssociatedCategoryEntity{id: $id, categoryId: $categoryId, cashFlowId: $cashFlowId}';
  }
}
