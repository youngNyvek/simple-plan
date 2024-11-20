class DateUtils {
  static (DateTime lowerDate, DateTime upperDate) getMonthBoundariesByDate(
      DateTime targetDateTime) {
    var lowerDate = DateTime(targetDateTime.year, targetDateTime.month, 1);
    var upperDate = DateTime(targetDateTime.year, targetDateTime.month + 1,
        0); // month + 1 -> this way, we can get the last day of month

    return (lowerDate, upperDate);
  }
}
