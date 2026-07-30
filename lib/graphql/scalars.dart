import 'package:decimal/decimal.dart';

export 'package:decimal/decimal.dart' show Decimal;

Decimal decimalFromJson(dynamic data) => Decimal.parse(data.toString());

dynamic decimalToJson(Decimal value) => value.toJson();

DateTime dateTimeFromJson(dynamic data) => DateTime.parse(data.toString());

dynamic dateTimeToJson(DateTime value) => value.toString();
