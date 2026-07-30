import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokenzyme_mobile/graphql/schema.graphql.dart';
import 'package:tokenzyme_mobile/hooks/models/date_time_converter.dart';
import 'package:tokenzyme_mobile/hooks/models/decimal_converter.dart';

part 'trade.g.dart';

@JsonSerializable()
class Trade {
  final String id;
  final String tokenAddress;
  final String accountAddress;
  final Enum$TradeType type;
  @DecimalConverter()
  final Decimal tokenAmount;
  @DecimalConverter()
  final Decimal ethAmount;
  @DecimalConverter()
  final Decimal fee;
  @DecimalConverter()
  final Decimal avgPrice;
  @DateTimeConverter()
  final DateTime createdAt;

  const Trade({
    required this.id,
    required this.tokenAddress,
    required this.accountAddress,
    required this.type,
    required this.tokenAmount,
    required this.ethAmount,
    required this.fee,
    required this.avgPrice,
    required this.createdAt,
  });

  factory Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);

  Map<String, dynamic> toJson() => _$TradeToJson(this);
}
