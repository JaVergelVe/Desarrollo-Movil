import 'package:intl/intl.dart';

class FormatNumber {
  static String converNumber(double number) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
  }
}
