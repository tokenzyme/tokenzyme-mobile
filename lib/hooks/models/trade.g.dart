// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trade _$TradeFromJson(Map<String, dynamic> json) => Trade(
      id: json['id'] as String,
      tokenAddress: json['tokenAddress'] as String,
      accountAddress: json['accountAddress'] as String,
      type: Enum$TradeType.fromJson(json['type'] as String),
      tokenAmount:
          const DecimalConverter().fromJson(json['tokenAmount'] as num),
      ethAmount: const DecimalConverter().fromJson(json['ethAmount'] as num),
      fee: const DecimalConverter().fromJson(json['fee'] as num),
      avgPrice: const DecimalConverter().fromJson(json['avgPrice'] as num),
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$TradeToJson(Trade instance) => <String, dynamic>{
      'id': instance.id,
      'tokenAddress': instance.tokenAddress,
      'accountAddress': instance.accountAddress,
      'type': instance.type,
      'tokenAmount': const DecimalConverter().toJson(instance.tokenAmount),
      'ethAmount': const DecimalConverter().toJson(instance.ethAmount),
      'fee': const DecimalConverter().toJson(instance.fee),
      'avgPrice': const DecimalConverter().toJson(instance.avgPrice),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
