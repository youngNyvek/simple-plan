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
    var currentDateFirstDay = DateTime(currentDate.year, currentDate.month, 1);
    var dueDateFirstDay = DateTime(dueDate.year, dueDate.month, 1);

    if (currentDateFirstDay.isAfter(dueDateFirstDay) ||
        currentDateFirstDay.isAtSameMomentAs(dueDateFirstDay)) {
      var yearDiff = currentDateFirstDay.year - dueDate.year;
      var monthDiff = currentDateFirstDay.month - dueDate.month;

      return (yearDiff * 12 + monthDiff) + 1;
    } else {
      return 0;
    }
  }

  DateTime getDueDate(DateTime currentDate) {
    if (currentDate.isAfter(dueDate) || currentDate.isAtSameMomentAs(dueDate)) {
      var newDueDate =
          DateTime(currentDate.year, currentDate.month, dueDate.day);

      if (DateTime.sunday == newDueDate.weekday) {
        return newDueDate.add(const Duration(days: 1));
      } else if (DateTime.saturday == newDueDate.weekday) {
        return newDueDate.add(const Duration(days: 2));
      }

      return newDueDate;
    }

    return dueDate;
  }
}
