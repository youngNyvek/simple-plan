import 'package:intl/intl.dart';

class StringUtils {
  static String formatCurrency(double n) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(n);
  }

  static String getMonthKey(DateTime dateTime) {
    return "${dateTime.month}:${dateTime.year}";
  }

  static DateTime getDateFromMonthKey(String monthKey) {
    var splittedMonthKey = monthKey.split(":");
    var month = int.parse(splittedMonthKey[0]);
    var year = int.parse(splittedMonthKey[1]);

    return DateTime(year, month, 1);
  }
}
