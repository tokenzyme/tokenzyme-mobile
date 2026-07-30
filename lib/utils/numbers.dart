import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

NumberFormat formatter = NumberFormat('#,##0.####', 'en_US');

String formatNumber(num value, {bool pretty = false}) {
  if (!pretty) {
    return formatter.format(value);
  }
  if (value >= 1_000_000) {
    return '${_trimDecimals((value / 1_000_000).toStringAsFixed(3))} mi';
  }
  if (value >= 1_000) {
    return '${_trimDecimals((value / 1_000).toStringAsFixed(3))} k';
  }
  return _trimDecimals(value.toStringAsFixed(3));
}

String formatDecimal(Decimal value, {bool pretty = false}) {
  return formatNumber(value.toDouble(), pretty: pretty);
}

String formatPercentage(num percentage) {
  num rounded = (percentage * 100).roundToDouble() / 100;
  return rounded % 1 == 0 ? rounded.toStringAsFixed(0) : rounded.toString();
}

Decimal parseAmount(String amount) {
  return Decimal.parse(amount.replaceAll(',', ''));
}

String _trimDecimals(String str) {
  return str.replaceFirst(RegExp(r'\.?0+$'), '');
}
