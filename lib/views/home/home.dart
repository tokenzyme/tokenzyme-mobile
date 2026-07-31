import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/branding.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/graphql/price.graphql.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/views/home/home_drawer.dart';
import 'package:tokenzyme_mobile/views/home/tabs/launchpad/launchpad.dart';
import 'package:tokenzyme_mobile/views/launch_token/launch_token.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<ScaffoldState> scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>(), <dynamic>[]);

    useQuery$GetEthPrice(
      Options$Query$GetEthPrice(
        onComplete: (Map<String, dynamic>? data, Query$GetEthPrice? parsedData) {
          if (parsedData != null) {
            ref.read(ethPriceProvider.notifier).update(parsedData.ethPrice);
          }
        },
      ),
    );

    void handleLaunchPressed() {
      context.push(LaunchToken());
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: appName.text(),
        actions: <Widget>[
          ElevatedButton.icon(
            label: 'Launch'.text(),
            icon: Icon(HugeIcons.strokeRoundedRocket01),
            onPressed: handleLaunchPressed,
          ),
          AppPadding.content.widthBox,
        ],
      ),
      drawer: MainDrawer(scaffoldKey: scaffoldKey),
      body: Launchpad(),
    );
  }
}
