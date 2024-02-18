class OccurrenceType {
  final String description;
  final int id;

  const OccurrenceType(this.description, this.id);

  static const revenue = OccurrenceType("Receita", 1);
  static const expense = OccurrenceType("Despesa", 2);
}
