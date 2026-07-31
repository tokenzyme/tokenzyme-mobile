import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:timeago/timeago.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/icon_size.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/sliver.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/extensions/widget.dart';
import 'package:tokenzyme_mobile/graphql/comment.graphql.dart';
import 'package:tokenzyme_mobile/graphql/schema.graphql.dart';
import 'package:tokenzyme_mobile/graphql/token.graphql.dart';
import 'package:tokenzyme_mobile/hooks/models/comment.dart';
import 'package:tokenzyme_mobile/hooks/use_app_kit_modal.dart';
import 'package:tokenzyme_mobile/hooks/use_comments_event.dart';
import 'package:tokenzyme_mobile/hooks/use_wallet_sign_in.dart';
import 'package:tokenzyme_mobile/widgets/account_badge.dart';
import 'package:tokenzyme_mobile/widgets/connect_wallet_button.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';

class Comments extends HookConsumerWidget {
  final Query$GetToken$token token;

  final int pageSize = 15;

  const Comments({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> hasMoreState = useState(false);
    ValueNotifier<int> commentsCountState = useState(token.commentsCount);

    TextEditingController commentController = useTextEditingController();

    AsyncSnapshot<ReownAppKitModal> appKitModalSnapshot = useAppKitModal(context, ref);

    SignInWithWalletFn signInWithWallet = useWalletSignIn();

    GraphQLClient gqlClient = useGraphQLClient();

    QueryHookResult<Query$ListComments> listCommentsQuery = useQuery$ListComments(Options$Query$ListComments(
      variables: Variables$Query$ListComments(tokenAddress: token.address, pageSize: pageSize),
      onComplete: (Map<String, dynamic>? data, Query$ListComments? parsedData) {
        if (parsedData != null) {
          hasMoreState.value = parsedData.comments.length % pageSize == 0;
        }
      },
    ));

    Mutation$AddComment$HookResult addCommentMutation = useMutation$AddComment(WidgetOptions$Mutation$AddComment(
      onCompleted: (Map<String, dynamic>? data, _) {
        if (data != null) {
          commentController.text = '';
        }
      },
      onError: (_) {
        context.showError('Error adding comment. Please try again later!');
      },
    ));

    useCommentsEvent(token.address, (Comment comment) {
      gqlClient.writeQuery$ListComments(
        variables: Variables$Query$ListComments(tokenAddress: token.address, pageSize: pageSize),
        data: Query$ListComments(comments: <Query$ListComments$comments>[
          Query$ListComments$comments(
            id: comment.id,
            accountAddress: comment.accountAddress,
            text: comment.text,
            createdAt: comment.createdAt,
          ),
          ...?listCommentsQuery.result.parsedData?.comments,
        ]),
      );
    });

    void handleAddCommentPressed() async {
      if (commentController.text.isEmpty) {
        return;
      }

      await signInWithWallet(appKitModalSnapshot.requireData);
      await addCommentMutation
          .runMutation(Variables$Mutation$AddComment(
            input: Input$AddCommentInput(
              tokenAddress: token.address,
              text: commentController.text,
            ),
          ))
          .networkResult;
    }

    Future<void> handleLoadMorePressed() async {
      QueryResult<Query$ListComments> fetchMoreCommentsResult = await listCommentsQuery.fetchMore(
        FetchMoreOptions$Query$ListComments(
          variables: Variables$Query$ListComments(
            tokenAddress: token.address,
            pageSize: pageSize,
            lastCommentId: listCommentsQuery.result.parsedData?.comments.last.id,
          ),
          updateQuery: (
            Map<String, dynamic>? previousResultData,
            Map<String, dynamic>? fetchMoreResultData,
          ) =>
              <String, dynamic>{
            ...?previousResultData,
            'comments': <dynamic>[
              ...previousResultData?['comments'],
              ...fetchMoreResultData?['comments'],
            ]
          },
        ),
      );
      if (fetchMoreCommentsResult.hasException) {
        if (context.mounted) {
          context.showError('Error loading more comments');
        }
        return;
      }
    }

    if (appKitModalSnapshot.isLoading ||
        (listCommentsQuery.result.isLoading && listCommentsQuery.result.data == null)) {
      return CircularProgressIndicator().toCenter();
    }

    if (appKitModalSnapshot.hasError || listCommentsQuery.result.hasException) {
      return 'An unexpected error occurred. Please try again!'
          .text(style: context.headlineSmall, align: TextAlign.center)
          .toCenter()
          .paddingAll(AppPadding.content);
    }

    ReownAppKitModal appKitModal = appKitModalSnapshot.requireData;
    List<Query$ListComments$comments> comments = listCommentsQuery.result.parsedData!.comments;

    return CustomScrollView(
      slivers: <Widget>[
        AppPadding.content.heightBox.sliver,
        Row(
          spacing: AppPadding.md,
          children: <Widget>[
            'Comments'.text(style: context.titleLarge, fontWeight: FontWeight.w500),
            '(${commentsCountState.value})'.text(style: context.titleLarge, color: context.colors.outline),
          ],
        ).sliver,
        AppPadding.content.heightBox.sliver,
        if (appKitModal.isConnected)
          Row(
            spacing: AppPadding.md,
            children: <Widget>[
              TextField(
                controller: commentController,
                decoration: InputDecoration(hintText: 'Write a comment...'),
              ).expanded(),
              IconButton.filled(
                icon: Icon(HugeIcons.strokeRoundedSent02, size: IconSize.md),
                onPressed: handleAddCommentPressed,
              ),
            ],
          ).sliver
        else
          Column(
            spacing: AppPadding.md,
            children: <Widget>[
              'Connect your wallet to add comments'.text(color: context.colors.outline),
              ConnectWalletButton(appKitModal: appKitModal),
            ],
          ).sliver,
        AppPadding.content.heightBox.sliver,
        if (comments.isEmpty)
          'No comments here yet'.text(style: context.headlineSmall).toCenter().sliverFillRemaining()
        else
          SliverList.separated(
            separatorBuilder: (_, _) => AppPadding.md.heightBox,
            itemCount: comments.length,
            itemBuilder: (_, int index) {
              Query$ListComments$comments comment = comments[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppPadding.md,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AccountBadge(address: comment.accountAddress),
                        format(comment.createdAt).text(color: context.colors.outline),
                      ],
                    ),
                    comment.text.text(),
                  ],
                ).paddingAll(AppPadding.content),
              );
            },
          ),
        if (comments.isNotEmpty && hasMoreState.value) ...<Widget>[
          AppPadding.content.heightBox.sliver,
          CustomFilledButton(
            label: 'Load more',
            onPressedAsync: handleLoadMorePressed,
          ).sliver
        ]
      ],
    ).paddingHorizontal(AppPadding.content).refreshIndicator(listCommentsQuery.refetch);
  }
}
