import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$GetEthPrice {
  Query$GetEthPrice({
    required this.ethPrice,
    this.$__typename = 'Query',
  });

  factory Query$GetEthPrice.fromJson(Map<String, dynamic> json) {
    final l$ethPrice = json['ethPrice'];
    final l$$__typename = json['__typename'];
    return Query$GetEthPrice(
      ethPrice: (l$ethPrice as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final double ethPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$ethPrice = ethPrice;
    _resultData['ethPrice'] = l$ethPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$ethPrice = ethPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$ethPrice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetEthPrice || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ethPrice = ethPrice;
    final lOther$ethPrice = other.ethPrice;
    if (l$ethPrice != lOther$ethPrice) {
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

extension UtilityExtension$Query$GetEthPrice on Query$GetEthPrice {
  CopyWith$Query$GetEthPrice<Query$GetEthPrice> get copyWith =>
      CopyWith$Query$GetEthPrice(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetEthPrice<TRes> {
  factory CopyWith$Query$GetEthPrice(
    Query$GetEthPrice instance,
    TRes Function(Query$GetEthPrice) then,
  ) = _CopyWithImpl$Query$GetEthPrice;

  factory CopyWith$Query$GetEthPrice.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEthPrice;

  TRes call({
    double? ethPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetEthPrice<TRes>
    implements CopyWith$Query$GetEthPrice<TRes> {
  _CopyWithImpl$Query$GetEthPrice(
    this._instance,
    this._then,
  );

  final Query$GetEthPrice _instance;

  final TRes Function(Query$GetEthPrice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? ethPrice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEthPrice(
        ethPrice: ethPrice == _undefined || ethPrice == null
            ? _instance.ethPrice
            : (ethPrice as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetEthPrice<TRes>
    implements CopyWith$Query$GetEthPrice<TRes> {
  _CopyWithStubImpl$Query$GetEthPrice(this._res);

  TRes _res;

  call({
    double? ethPrice,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeQueryGetEthPrice = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetEthPrice'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'ethPrice'),
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
]);
Query$GetEthPrice _parserFn$Query$GetEthPrice(Map<String, dynamic> data) =>
    Query$GetEthPrice.fromJson(data);
typedef OnQueryComplete$Query$GetEthPrice = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetEthPrice?,
);

class Options$Query$GetEthPrice
    extends graphql.QueryOptions<Query$GetEthPrice> {
  Options$Query$GetEthPrice({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEthPrice? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEthPrice? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
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
                    data == null ? null : _parserFn$Query$GetEthPrice(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetEthPrice,
          parserFn: _parserFn$Query$GetEthPrice,
        );

  final OnQueryComplete$Query$GetEthPrice? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetEthPrice
    extends graphql.WatchQueryOptions<Query$GetEthPrice> {
  WatchOptions$Query$GetEthPrice({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEthPrice? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetEthPrice,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetEthPrice,
        );
}

class FetchMoreOptions$Query$GetEthPrice extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEthPrice({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetEthPrice,
        );
}

extension ClientExtension$Query$GetEthPrice on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEthPrice>> query$GetEthPrice(
          [Options$Query$GetEthPrice? options]) async =>
      await this.query(options ?? Options$Query$GetEthPrice());
  graphql.ObservableQuery<Query$GetEthPrice> watchQuery$GetEthPrice(
          [WatchOptions$Query$GetEthPrice? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetEthPrice());
  void writeQuery$GetEthPrice({
    required Query$GetEthPrice data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetEthPrice)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetEthPrice? readQuery$GetEthPrice({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetEthPrice)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEthPrice.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetEthPrice> useQuery$GetEthPrice(
        [Options$Query$GetEthPrice? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetEthPrice());
graphql.ObservableQuery<Query$GetEthPrice> useWatchQuery$GetEthPrice(
        [WatchOptions$Query$GetEthPrice? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetEthPrice());

class Query$GetEthPrice$Widget
    extends graphql_flutter.Query<Query$GetEthPrice> {
  Query$GetEthPrice$Widget({
    widgets.Key? key,
    Options$Query$GetEthPrice? options,
    required graphql_flutter.QueryBuilder<Query$GetEthPrice> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetEthPrice(),
          builder: builder,
        );
}
