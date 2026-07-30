import 'package:json_annotation/json_annotation.dart';
import 'package:tokenzyme_mobile/hooks/models/date_time_converter.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int id;
  final String tokenAddress;
  final String accountAddress;
  final String text;
  @DateTimeConverter()
  final DateTime createdAt;

  const Comment({
    required this.id,
    required this.tokenAddress,
    required this.accountAddress,
    required this.text,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
