class RecurrenceType {
  final String description;
  final int id;

  const RecurrenceType(this.description, this.id);

  static const none = RecurrenceType("Sem recorrência", 1);
  static const every = RecurrenceType("Mensal", 2);
  static const installment = RecurrenceType("Parcelado", 3);

  static const recurrenceList = [none, every, installment];

  static RecurrenceType getRecurrenceByDesc(String desc) {
    return recurrenceList.firstWhere((item) => item.description == desc);
  }
}
