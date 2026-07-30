import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/utils/env.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Chart extends HookWidget {
  final Query$GetToken$token token;

  const Chart({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = useMemoized(
      () => WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('${getAppUrl()}/tokens/${token.address}/chart')),
      <dynamic>[],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: WebViewWidget(
        controller: controller,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
        },
      ).sizedBox(height: 420),
    );
  }
}
