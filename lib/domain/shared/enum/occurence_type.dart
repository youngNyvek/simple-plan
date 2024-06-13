class OccurrenceType {
  final String description;
  final int id;

  const OccurrenceType(this.description, this.id);

  static const income = OccurrenceType("Ganho", 1);
  static const expense = OccurrenceType("Gasto", 2);

  static const occurrencesList = [income, expense];
}
