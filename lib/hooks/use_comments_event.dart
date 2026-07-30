import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tokenzyme_mobile/hooks/models/comment.dart';
import 'package:tokenzyme_mobile/hooks/use_socket_event.dart';

void useCommentsEvent(String tokenAddress, void Function(Comment) handler) {
  Function(dynamic) converterHandler = useCallback((dynamic commentJson) {
    handler(Comment.fromJson(commentJson));
  }, <dynamic>[handler]);

  useCoreSocketEvent('tokens:$tokenAddress:comments', converterHandler);
}
