class TransactionEntryEntity {
  final int? id;
  final String description;
  final double amount;
  final DateTime dueDate;
  final int occurrenceType;
  final bool done;
  DateTime? finalDate;
  final int? installment;
  final List<String> categories;
  final int recurrenceType;

  TransactionEntryEntity(
      {required this.description,
      required this.amount,
      required this.dueDate,
      required this.occurrenceType,
      required this.done,
      required this.categories,
      required this.recurrenceType,
      this.id,
      this.installment,
      this.finalDate}) {
    if (installment != null && finalDate == null) {
      finalDate = DateTime(
          dueDate.year, dueDate.month + (installment! - 1), dueDate.day);
    }
  }

  int getCurrentInstallment(DateTime currentDate) {
    var dueDateFirstDay = DateTime(dueDate.year, dueDate.month, 1);
    if (currentDate.isAfter(dueDateFirstDay) ||
        currentDate.isAtSameMomentAs(dueDateFirstDay)) {
      var yearDiff = currentDate.year - dueDate.year;
      var monthDiff = currentDate.month - dueDate.month;

      return (yearDiff * 12 + monthDiff) + 1;
    } else {
      return 0;
    }
  }
}
