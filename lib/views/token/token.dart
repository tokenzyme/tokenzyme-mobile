import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/views/token/tabs/comments.dart';
import 'package:tokenzyme_mobile/views/token/tabs/info/info.dart';
import 'package:tokenzyme_mobile/views/token/tabs/trades.dart';
import 'package:tokenzyme_mobile/widgets/account_button.dart';

class Token extends HookWidget {
  final String address;

  const Token({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> pageIndexState = useState(0);
    PageController pageController = usePageController();

    QueryHookResult<Query$GetToken> getTokenQuery = useQuery$GetToken(Options$Query$GetToken(
      variables: Variables$Query$GetToken(address: address),
    ));

    Future<void> handleRefresh() async {
      await getTokenQuery.refetch();
    }

    void handleNavigationBarItemPressed(int pageIndex) {
      if (pageController.hasClients) {
        pageController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
        pageIndexState.value = pageIndex;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: (getTokenQuery.result.parsedData?.token.name ?? 'Token').text(),
        actions: <Widget>[
          AccountButton(),
          AppPadding.content.widthBox,
        ],
      ),
      body: Builder(builder: (_) {
        if (getTokenQuery.result.isLoading) {
          return CircularProgressIndicator().toCenter();
        }
        if (getTokenQuery.result.hasException) {
          return 'An unexpected error occurred. Please try again!'
              .text(style: context.headlineSmall, align: TextAlign.center)
              .toCenter()
              .paddingAll(AppPadding.content);
        }

        Query$GetToken$token token = getTokenQuery.result.parsedData!.token;
        return PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Info(token: token, onRefresh: handleRefresh),
            Trades(token: token),
            Comments(token: token),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndexState.value,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedChart01), label: 'Info'),
          BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedTransaction), label: 'Trades'),
          BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedComment02), label: 'Comments'),
        ],
        onTap: handleNavigationBarItemPressed,
      ),
    );
  }
}
