import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:tokenzyme_mobile/graphql/scalars.dart';
import 'schema.graphql.dart';

class Variables$Query$ListComments {
  factory Variables$Query$ListComments({
    required String tokenAddress,
    required int pageSize,
    int? lastCommentId,
  }) =>
      Variables$Query$ListComments._({
        r'tokenAddress': tokenAddress,
        r'pageSize': pageSize,
        if (lastCommentId != null) r'lastCommentId': lastCommentId,
      });

  Variables$Query$ListComments._(this._$data);

  factory Variables$Query$ListComments.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = data['tokenAddress'];
    result$data['tokenAddress'] = (l$tokenAddress as String);
    final l$pageSize = data['pageSize'];
    result$data['pageSize'] = (l$pageSize as int);
    if (data.containsKey('lastCommentId')) {
      final l$lastCommentId = data['lastCommentId'];
      result$data['lastCommentId'] = (l$lastCommentId as int?);
    }
    return Variables$Query$ListComments._(result$data);
  }

  Map<String, dynamic> _$data;

  String get tokenAddress => (_$data['tokenAddress'] as String);

  int get pageSize => (_$data['pageSize'] as int);

  int? get lastCommentId => (_$data['lastCommentId'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = tokenAddress;
    result$data['tokenAddress'] = l$tokenAddress;
    final l$pageSize = pageSize;
    result$data['pageSize'] = l$pageSize;
    if (_$data.containsKey('lastCommentId')) {
      final l$lastCommentId = lastCommentId;
      result$data['lastCommentId'] = l$lastCommentId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$ListComments<Variables$Query$ListComments>
      get copyWith => CopyWith$Variables$Query$ListComments(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ListComments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$tokenAddress = tokenAddress;
    final lOther$tokenAddress = other.tokenAddress;
    if (l$tokenAddress != lOther$tokenAddress) {
      return false;
    }
    final l$pageSize = pageSize;
    final lOther$pageSize = other.pageSize;
    if (l$pageSize != lOther$pageSize) {
      return false;
    }
    final l$lastCommentId = lastCommentId;
    final lOther$lastCommentId = other.lastCommentId;
    if (_$data.containsKey('lastCommentId') !=
        other._$data.containsKey('lastCommentId')) {
      return false;
    }
    if (l$lastCommentId != lOther$lastCommentId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$tokenAddress = tokenAddress;
    final l$pageSize = pageSize;
    final l$lastCommentId = lastCommentId;
    return Object.hashAll([
      l$tokenAddress,
      l$pageSize,
      _$data.containsKey('lastCommentId') ? l$lastCommentId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$ListComments<TRes> {
  factory CopyWith$Variables$Query$ListComments(
    Variables$Query$ListComments instance,
    TRes Function(Variables$Query$ListComments) then,
  ) = _CopyWithImpl$Variables$Query$ListComments;

  factory CopyWith$Variables$Query$ListComments.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ListComments;

  TRes call({
    String? tokenAddress,
    int? pageSize,
    int? lastCommentId,
  });
}

class _CopyWithImpl$Variables$Query$ListComments<TRes>
    implements CopyWith$Variables$Query$ListComments<TRes> {
  _CopyWithImpl$Variables$Query$ListComments(
    this._instance,
    this._then,
  );

  final Variables$Query$ListComments _instance;

  final TRes Function(Variables$Query$ListComments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tokenAddress = _undefined,
    Object? pageSize = _undefined,
    Object? lastCommentId = _undefined,
  }) =>
      _then(Variables$Query$ListComments._({
        ..._instance._$data,
        if (tokenAddress != _undefined && tokenAddress != null)
          'tokenAddress': (tokenAddress as String),
        if (pageSize != _undefined && pageSize != null)
          'pageSize': (pageSize as int),
        if (lastCommentId != _undefined)
          'lastCommentId': (lastCommentId as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$ListComments<TRes>
    implements CopyWith$Variables$Query$ListComments<TRes> {
  _CopyWithStubImpl$Variables$Query$ListComments(this._res);

  TRes _res;

  call({
    String? tokenAddress,
    int? pageSize,
    int? lastCommentId,
  }) =>
      _res;
}

class Query$ListComments {
  Query$ListComments({
    required this.comments,
    this.$__typename = 'Query',
  });

  factory Query$ListComments.fromJson(Map<String, dynamic> json) {
    final l$comments = json['comments'];
    final l$$__typename = json['__typename'];
    return Query$ListComments(
      comments: (l$comments as List<dynamic>)
          .map((e) =>
              Query$ListComments$comments.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ListComments$comments> comments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comments = comments;
    _resultData['comments'] = l$comments.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comments = comments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$comments.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListComments || runtimeType != other.runtimeType) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments.length != lOther$comments.length) {
      return false;
    }
    for (int i = 0; i < l$comments.length; i++) {
      final l$comments$entry = l$comments[i];
      final lOther$comments$entry = lOther$comments[i];
      if (l$comments$entry != lOther$comments$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ListComments on Query$ListComments {
  CopyWith$Query$ListComments<Query$ListComments> get copyWith =>
      CopyWith$Query$ListComments(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ListComments<TRes> {
  factory CopyWith$Query$ListComments(
    Query$ListComments instance,
    TRes Function(Query$ListComments) then,
  ) = _CopyWithImpl$Query$ListComments;

  factory CopyWith$Query$ListComments.stub(TRes res) =
      _CopyWithStubImpl$Query$ListComments;

  TRes call({
    List<Query$ListComments$comments>? comments,
    String? $__typename,
  });
  TRes comments(
      Iterable<Query$ListComments$comments> Function(
              Iterable<
                  CopyWith$Query$ListComments$comments<
                      Query$ListComments$comments>>)
          _fn);
}

class _CopyWithImpl$Query$ListComments<TRes>
    implements CopyWith$Query$ListComments<TRes> {
  _CopyWithImpl$Query$ListComments(
    this._instance,
    this._then,
  );

  final Query$ListComments _instance;

  final TRes Function(Query$ListComments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? comments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ListComments(
        comments: comments == _undefined || comments == null
            ? _instance.comments
            : (comments as List<Query$ListComments$comments>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes comments(
          Iterable<Query$ListComments$comments> Function(
                  Iterable<
                      CopyWith$Query$ListComments$comments<
                          Query$ListComments$comments>>)
              _fn) =>
      call(
          comments: _fn(_instance.comments
              .map((e) => CopyWith$Query$ListComments$comments(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$ListComments<TRes>
    implements CopyWith$Query$ListComments<TRes> {
  _CopyWithStubImpl$Query$ListComments(this._res);

  TRes _res;

  call({
    List<Query$ListComments$comments>? comments,
    String? $__typename,
  }) =>
      _res;

  comments(_fn) => _res;
}

const documentNodeQueryListComments = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ListComments'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'tokenAddress')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageSize')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lastCommentId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'comments'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'tokenAddress'),
            value: VariableNode(name: NameNode(value: 'tokenAddress')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageSize'),
            value: VariableNode(name: NameNode(value: 'pageSize')),
          ),
          ArgumentNode(
            name: NameNode(value: 'lastCommentId'),
            value: VariableNode(name: NameNode(value: 'lastCommentId')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'accountAddress'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'text'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$ListComments _parserFn$Query$ListComments(Map<String, dynamic> data) =>
    Query$ListComments.fromJson(data);
typedef OnQueryComplete$Query$ListComments = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ListComments?,
);

class Options$Query$ListComments
    extends graphql.QueryOptions<Query$ListComments> {
  Options$Query$ListComments({
    String? operationName,
    required Variables$Query$ListComments variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListComments? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ListComments? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$ListComments(data),
                  ),
          onError: onError,
          document: documentNodeQueryListComments,
          parserFn: _parserFn$Query$ListComments,
        );

  final OnQueryComplete$Query$ListComments? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ListComments
    extends graphql.WatchQueryOptions<Query$ListComments> {
  WatchOptions$Query$ListComments({
    String? operationName,
    required Variables$Query$ListComments variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListComments? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryListComments,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ListComments,
        );
}

class FetchMoreOptions$Query$ListComments extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ListComments({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ListComments variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryListComments,
        );
}

extension ClientExtension$Query$ListComments on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ListComments>> query$ListComments(
          Options$Query$ListComments options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$ListComments> watchQuery$ListComments(
          WatchOptions$Query$ListComments options) =>
      this.watchQuery(options);
  void writeQuery$ListComments({
    required Query$ListComments data,
    required Variables$Query$ListComments variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryListComments),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ListComments? readQuery$ListComments({
    required Variables$Query$ListComments variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryListComments),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ListComments.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ListComments> useQuery$ListComments(
        Options$Query$ListComments options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ListComments> useWatchQuery$ListComments(
        WatchOptions$Query$ListComments options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ListComments$Widget
    extends graphql_flutter.Query<Query$ListComments> {
  Query$ListComments$Widget({
    widgets.Key? key,
    required Options$Query$ListComments options,
    required graphql_flutter.QueryBuilder<Query$ListComments> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ListComments$comments {
  Query$ListComments$comments({
    required this.id,
    required this.accountAddress,
    required this.text,
    required this.createdAt,
    this.$__typename = 'Comment',
  });

  factory Query$ListComments$comments.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accountAddress = json['accountAddress'];
    final l$text = json['text'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$ListComments$comments(
      id: (l$id as int),
      accountAddress: (l$accountAddress as String),
      text: (l$text as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String accountAddress;

  final String text;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accountAddress = accountAddress;
    _resultData['accountAddress'] = l$accountAddress;
    final l$text = text;
    _resultData['text'] = l$text;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$accountAddress = accountAddress;
    final l$text = text;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$accountAddress,
      l$text,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListComments$comments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accountAddress = accountAddress;
    final lOther$accountAddress = other.accountAddress;
    if (l$accountAddress != lOther$accountAddress) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$ListComments$comments
    on Query$ListComments$comments {
  CopyWith$Query$ListComments$comments<Query$ListComments$comments>
      get copyWith => CopyWith$Query$ListComments$comments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ListComments$comments<TRes> {
  factory CopyWith$Query$ListComments$comments(
    Query$ListComments$comments instance,
    TRes Function(Query$ListComments$comments) then,
  ) = _CopyWithImpl$Query$ListComments$comments;

  factory CopyWith$Query$ListComments$comments.stub(TRes res) =
      _CopyWithStubImpl$Query$ListComments$comments;

  TRes call({
    int? id,
    String? accountAddress,
    String? text,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ListComments$comments<TRes>
    implements CopyWith$Query$ListComments$comments<TRes> {
  _CopyWithImpl$Query$ListComments$comments(
    this._instance,
    this._then,
  );

  final Query$ListComments$comments _instance;

  final TRes Function(Query$ListComments$comments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? accountAddress = _undefined,
    Object? text = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ListComments$comments(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accountAddress: accountAddress == _undefined || accountAddress == null
            ? _instance.accountAddress
            : (accountAddress as String),
        text: text == _undefined || text == null
            ? _instance.text
            : (text as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ListComments$comments<TRes>
    implements CopyWith$Query$ListComments$comments<TRes> {
  _CopyWithStubImpl$Query$ListComments$comments(this._res);

  TRes _res;

  call({
    int? id,
    String? accountAddress,
    String? text,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AddComment {
  factory Variables$Mutation$AddComment(
          {required Input$AddCommentInput input}) =>
      Variables$Mutation$AddComment._({
        r'input': input,
      });

  Variables$Mutation$AddComment._(this._$data);

  factory Variables$Mutation$AddComment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$AddCommentInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$AddComment._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$AddCommentInput get input => (_$data['input'] as Input$AddCommentInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$AddComment<Variables$Mutation$AddComment>
      get copyWith => CopyWith$Variables$Mutation$AddComment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AddComment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$AddComment<TRes> {
  factory CopyWith$Variables$Mutation$AddComment(
    Variables$Mutation$AddComment instance,
    TRes Function(Variables$Mutation$AddComment) then,
  ) = _CopyWithImpl$Variables$Mutation$AddComment;

  factory CopyWith$Variables$Mutation$AddComment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddComment;

  TRes call({Input$AddCommentInput? input});
}

class _CopyWithImpl$Variables$Mutation$AddComment<TRes>
    implements CopyWith$Variables$Mutation$AddComment<TRes> {
  _CopyWithImpl$Variables$Mutation$AddComment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddComment _instance;

  final TRes Function(Variables$Mutation$AddComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$AddComment._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$AddCommentInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddComment<TRes>
    implements CopyWith$Variables$Mutation$AddComment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddComment(this._res);

  TRes _res;

  call({Input$AddCommentInput? input}) => _res;
}

class Mutation$AddComment {
  Mutation$AddComment({
    required this.addComment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddComment.fromJson(Map<String, dynamic> json) {
    final l$addComment = json['addComment'];
    final l$$__typename = json['__typename'];
    return Mutation$AddComment(
      addComment: Mutation$AddComment$addComment.fromJson(
          (l$addComment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddComment$addComment addComment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addComment = addComment;
    _resultData['addComment'] = l$addComment.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addComment = addComment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addComment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AddComment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$addComment = addComment;
    final lOther$addComment = other.addComment;
    if (l$addComment != lOther$addComment) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$AddComment on Mutation$AddComment {
  CopyWith$Mutation$AddComment<Mutation$AddComment> get copyWith =>
      CopyWith$Mutation$AddComment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddComment<TRes> {
  factory CopyWith$Mutation$AddComment(
    Mutation$AddComment instance,
    TRes Function(Mutation$AddComment) then,
  ) = _CopyWithImpl$Mutation$AddComment;

  factory CopyWith$Mutation$AddComment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddComment;

  TRes call({
    Mutation$AddComment$addComment? addComment,
    String? $__typename,
  });
  CopyWith$Mutation$AddComment$addComment<TRes> get addComment;
}

class _CopyWithImpl$Mutation$AddComment<TRes>
    implements CopyWith$Mutation$AddComment<TRes> {
  _CopyWithImpl$Mutation$AddComment(
    this._instance,
    this._then,
  );

  final Mutation$AddComment _instance;

  final TRes Function(Mutation$AddComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addComment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddComment(
        addComment: addComment == _undefined || addComment == null
            ? _instance.addComment
            : (addComment as Mutation$AddComment$addComment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddComment$addComment<TRes> get addComment {
    final local$addComment = _instance.addComment;
    return CopyWith$Mutation$AddComment$addComment(
        local$addComment, (e) => call(addComment: e));
  }
}

class _CopyWithStubImpl$Mutation$AddComment<TRes>
    implements CopyWith$Mutation$AddComment<TRes> {
  _CopyWithStubImpl$Mutation$AddComment(this._res);

  TRes _res;

  call({
    Mutation$AddComment$addComment? addComment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddComment$addComment<TRes> get addComment =>
      CopyWith$Mutation$AddComment$addComment.stub(_res);
}

const documentNodeMutationAddComment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddComment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'AddCommentInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addComment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$AddComment _parserFn$Mutation$AddComment(Map<String, dynamic> data) =>
    Mutation$AddComment.fromJson(data);
typedef OnMutationCompleted$Mutation$AddComment = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddComment?,
);

class Options$Mutation$AddComment
    extends graphql.MutationOptions<Mutation$AddComment> {
  Options$Mutation$AddComment({
    String? operationName,
    required Variables$Mutation$AddComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddComment>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$AddComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddComment,
          parserFn: _parserFn$Mutation$AddComment,
        );

  final OnMutationCompleted$Mutation$AddComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddComment
    extends graphql.WatchQueryOptions<Mutation$AddComment> {
  WatchOptions$Mutation$AddComment({
    String? operationName,
    required Variables$Mutation$AddComment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddComment? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationAddComment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddComment,
        );
}

extension ClientExtension$Mutation$AddComment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddComment>> mutate$AddComment(
          Options$Mutation$AddComment options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddComment> watchMutation$AddComment(
          WatchOptions$Mutation$AddComment options) =>
      this.watchMutation(options);
}

class Mutation$AddComment$HookResult {
  Mutation$AddComment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddComment runMutation;

  final graphql.QueryResult<Mutation$AddComment> result;
}

Mutation$AddComment$HookResult useMutation$AddComment(
    [WidgetOptions$Mutation$AddComment? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddComment());
  return Mutation$AddComment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddComment> useWatchMutation$AddComment(
        WatchOptions$Mutation$AddComment options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddComment
    extends graphql.MutationOptions<Mutation$AddComment> {
  WidgetOptions$Mutation$AddComment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddComment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddComment? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddComment>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$AddComment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddComment,
          parserFn: _parserFn$Mutation$AddComment,
        );

  final OnMutationCompleted$Mutation$AddComment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddComment
    = graphql.MultiSourceResult<Mutation$AddComment> Function(
  Variables$Mutation$AddComment, {
  Object? optimisticResult,
  Mutation$AddComment? typedOptimisticResult,
});
typedef Builder$Mutation$AddComment = widgets.Widget Function(
  RunMutation$Mutation$AddComment,
  graphql.QueryResult<Mutation$AddComment>?,
);

class Mutation$AddComment$Widget
    extends graphql_flutter.Mutation<Mutation$AddComment> {
  Mutation$AddComment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddComment? options,
    required Builder$Mutation$AddComment builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddComment(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$AddComment$addComment {
  Mutation$AddComment$addComment({
    required this.id,
    this.$__typename = 'Comment',
  });

  factory Mutation$AddComment$addComment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$AddComment$addComment(
      id: (l$id as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AddComment$addComment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$AddComment$addComment
    on Mutation$AddComment$addComment {
  CopyWith$Mutation$AddComment$addComment<Mutation$AddComment$addComment>
      get copyWith => CopyWith$Mutation$AddComment$addComment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddComment$addComment<TRes> {
  factory CopyWith$Mutation$AddComment$addComment(
    Mutation$AddComment$addComment instance,
    TRes Function(Mutation$AddComment$addComment) then,
  ) = _CopyWithImpl$Mutation$AddComment$addComment;

  factory CopyWith$Mutation$AddComment$addComment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddComment$addComment;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddComment$addComment<TRes>
    implements CopyWith$Mutation$AddComment$addComment<TRes> {
  _CopyWithImpl$Mutation$AddComment$addComment(
    this._instance,
    this._then,
  );

  final Mutation$AddComment$addComment _instance;

  final TRes Function(Mutation$AddComment$addComment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddComment$addComment(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddComment$addComment<TRes>
    implements CopyWith$Mutation$AddComment$addComment<TRes> {
  _CopyWithStubImpl$Mutation$AddComment$addComment(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
