class CategoryEntity {
  final int id;
  final String name;
  final String color;
  final int type;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.color,
    required this.type,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'CategoryEntity{id: $id, name: $name, color: $color, type: $type}';
  }
}
