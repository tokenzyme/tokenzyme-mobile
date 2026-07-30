import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter extends JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String value) {
    return DateTime.parse(value);
  }

  @override
  String toJson(DateTime value) {
    return value.toString();
  }
}
