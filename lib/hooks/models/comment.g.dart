// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
  id: (json['id'] as num).toInt(),
  tokenAddress: json['tokenAddress'] as String,
  accountAddress: json['accountAddress'] as String,
  text: json['text'] as String,
  createdAt: const DateTimeConverter().fromJson(json['createdAt'] as String),
);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'id': instance.id,
  'tokenAddress': instance.tokenAddress,
  'accountAddress': instance.accountAddress,
  'text': instance.text,
  'createdAt': const DateTimeConverter().toJson(instance.createdAt),
};
