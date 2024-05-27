class TransactionEntryEntity {
  final int? id;
  final String description;
  final double amount;
  DateTime dueDate;
  final int occurrenceType;
  bool done;
  DateTime? finalDate;
  final int? installment;
  final List<String> categories;
  final int recurrenceType;
  final List<String>? excludedMonths;

  TransactionEntryEntity(
      {required this.description,
      required this.amount,
      required this.dueDate,
      required this.occurrenceType,
      required this.done,
      required this.categories,
      required this.recurrenceType,
      this.excludedMonths,
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

      if (newDueDate.month > currentDate.month) {
        newDueDate = DateTime(newDueDate.year, newDueDate.month,
            0); // this way, we can get the last day of feb
      }

      return newDueDate;
    }

    return dueDate;
  }
}
