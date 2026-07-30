import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

class DecimalConverter extends JsonConverter<Decimal, num> {
  const DecimalConverter();

  @override
  Decimal fromJson(num value) {
    return Decimal.parse(value.toString());
  }

  @override
  num toJson(Decimal value) {
    return value.toDouble();
  }
}
