import 'package:intl/intl.dart';

class StringUtils {
  static String formatCurrency(double n) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(n);
  }
}
