class TypeOfOccurrenceEntity {
  final int id;
  final String description;

  TypeOfOccurrenceEntity({
    required this.id,
    required this.description,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'TypeOfOccurrenceEntity{id: $id, description: $description}';
  }
}
