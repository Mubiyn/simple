import 'package:intl/intl.dart';

class NumberUtil {
  static String currencyFormat(double value, [int precision = 2]) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: precision,
    ).format(value);
  }
}
