class TypeOfOccurrence {
  final int id;
  final String description;

  TypeOfOccurrence({
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
    return 'TypeOfOccurrence{id: $id, description: $description}';
  }
}
