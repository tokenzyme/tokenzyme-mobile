import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:tokenzyme_mobile/graphql/scalars.dart';
import 'schema.graphql.dart';

class Variables$Query$ListTrades {
  factory Variables$Query$ListTrades({
    required String tokenAddress,
    required int pageSize,
    String? lastTradeId,
  }) =>
      Variables$Query$ListTrades._({
        r'tokenAddress': tokenAddress,
        r'pageSize': pageSize,
        if (lastTradeId != null) r'lastTradeId': lastTradeId,
      });

  Variables$Query$ListTrades._(this._$data);

  factory Variables$Query$ListTrades.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = data['tokenAddress'];
    result$data['tokenAddress'] = (l$tokenAddress as String);
    final l$pageSize = data['pageSize'];
    result$data['pageSize'] = (l$pageSize as int);
    if (data.containsKey('lastTradeId')) {
      final l$lastTradeId = data['lastTradeId'];
      result$data['lastTradeId'] = (l$lastTradeId as String?);
    }
    return Variables$Query$ListTrades._(result$data);
  }

  Map<String, dynamic> _$data;

  String get tokenAddress => (_$data['tokenAddress'] as String);

  int get pageSize => (_$data['pageSize'] as int);

  String? get lastTradeId => (_$data['lastTradeId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = tokenAddress;
    result$data['tokenAddress'] = l$tokenAddress;
    final l$pageSize = pageSize;
    result$data['pageSize'] = l$pageSize;
    if (_$data.containsKey('lastTradeId')) {
      final l$lastTradeId = lastTradeId;
      result$data['lastTradeId'] = l$lastTradeId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$ListTrades<Variables$Query$ListTrades>
      get copyWith => CopyWith$Variables$Query$ListTrades(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ListTrades ||
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
    final l$lastTradeId = lastTradeId;
    final lOther$lastTradeId = other.lastTradeId;
    if (_$data.containsKey('lastTradeId') !=
        other._$data.containsKey('lastTradeId')) {
      return false;
    }
    if (l$lastTradeId != lOther$lastTradeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$tokenAddress = tokenAddress;
    final l$pageSize = pageSize;
    final l$lastTradeId = lastTradeId;
    return Object.hashAll([
      l$tokenAddress,
      l$pageSize,
      _$data.containsKey('lastTradeId') ? l$lastTradeId : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$ListTrades<TRes> {
  factory CopyWith$Variables$Query$ListTrades(
    Variables$Query$ListTrades instance,
    TRes Function(Variables$Query$ListTrades) then,
  ) = _CopyWithImpl$Variables$Query$ListTrades;

  factory CopyWith$Variables$Query$ListTrades.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ListTrades;

  TRes call({
    String? tokenAddress,
    int? pageSize,
    String? lastTradeId,
  });
}

class _CopyWithImpl$Variables$Query$ListTrades<TRes>
    implements CopyWith$Variables$Query$ListTrades<TRes> {
  _CopyWithImpl$Variables$Query$ListTrades(
    this._instance,
    this._then,
  );

  final Variables$Query$ListTrades _instance;

  final TRes Function(Variables$Query$ListTrades) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tokenAddress = _undefined,
    Object? pageSize = _undefined,
    Object? lastTradeId = _undefined,
  }) =>
      _then(Variables$Query$ListTrades._({
        ..._instance._$data,
        if (tokenAddress != _undefined && tokenAddress != null)
          'tokenAddress': (tokenAddress as String),
        if (pageSize != _undefined && pageSize != null)
          'pageSize': (pageSize as int),
        if (lastTradeId != _undefined) 'lastTradeId': (lastTradeId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$ListTrades<TRes>
    implements CopyWith$Variables$Query$ListTrades<TRes> {
  _CopyWithStubImpl$Variables$Query$ListTrades(this._res);

  TRes _res;

  call({
    String? tokenAddress,
    int? pageSize,
    String? lastTradeId,
  }) =>
      _res;
}

class Query$ListTrades {
  Query$ListTrades({
    required this.trades,
    this.$__typename = 'Query',
  });

  factory Query$ListTrades.fromJson(Map<String, dynamic> json) {
    final l$trades = json['trades'];
    final l$$__typename = json['__typename'];
    return Query$ListTrades(
      trades: (l$trades as List<dynamic>)
          .map((e) =>
              Query$ListTrades$trades.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ListTrades$trades> trades;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$trades = trades;
    _resultData['trades'] = l$trades.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$trades = trades;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$trades.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListTrades || runtimeType != other.runtimeType) {
      return false;
    }
    final l$trades = trades;
    final lOther$trades = other.trades;
    if (l$trades.length != lOther$trades.length) {
      return false;
    }
    for (int i = 0; i < l$trades.length; i++) {
      final l$trades$entry = l$trades[i];
      final lOther$trades$entry = lOther$trades[i];
      if (l$trades$entry != lOther$trades$entry) {
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

extension UtilityExtension$Query$ListTrades on Query$ListTrades {
  CopyWith$Query$ListTrades<Query$ListTrades> get copyWith =>
      CopyWith$Query$ListTrades(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ListTrades<TRes> {
  factory CopyWith$Query$ListTrades(
    Query$ListTrades instance,
    TRes Function(Query$ListTrades) then,
  ) = _CopyWithImpl$Query$ListTrades;

  factory CopyWith$Query$ListTrades.stub(TRes res) =
      _CopyWithStubImpl$Query$ListTrades;

  TRes call({
    List<Query$ListTrades$trades>? trades,
    String? $__typename,
  });
  TRes trades(
      Iterable<Query$ListTrades$trades> Function(
              Iterable<
                  CopyWith$Query$ListTrades$trades<Query$ListTrades$trades>>)
          _fn);
}

class _CopyWithImpl$Query$ListTrades<TRes>
    implements CopyWith$Query$ListTrades<TRes> {
  _CopyWithImpl$Query$ListTrades(
    this._instance,
    this._then,
  );

  final Query$ListTrades _instance;

  final TRes Function(Query$ListTrades) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? trades = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ListTrades(
        trades: trades == _undefined || trades == null
            ? _instance.trades
            : (trades as List<Query$ListTrades$trades>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes trades(
          Iterable<Query$ListTrades$trades> Function(
                  Iterable<
                      CopyWith$Query$ListTrades$trades<
                          Query$ListTrades$trades>>)
              _fn) =>
      call(
          trades:
              _fn(_instance.trades.map((e) => CopyWith$Query$ListTrades$trades(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$ListTrades<TRes>
    implements CopyWith$Query$ListTrades<TRes> {
  _CopyWithStubImpl$Query$ListTrades(this._res);

  TRes _res;

  call({
    List<Query$ListTrades$trades>? trades,
    String? $__typename,
  }) =>
      _res;

  trades(_fn) => _res;
}

const documentNodeQueryListTrades = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ListTrades'),
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
        variable: VariableNode(name: NameNode(value: 'lastTradeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'trades'),
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
            name: NameNode(value: 'lastTradeId'),
            value: VariableNode(name: NameNode(value: 'lastTradeId')),
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
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tokenAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'ethAmount'),
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
Query$ListTrades _parserFn$Query$ListTrades(Map<String, dynamic> data) =>
    Query$ListTrades.fromJson(data);
typedef OnQueryComplete$Query$ListTrades = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ListTrades?,
);

class Options$Query$ListTrades extends graphql.QueryOptions<Query$ListTrades> {
  Options$Query$ListTrades({
    String? operationName,
    required Variables$Query$ListTrades variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListTrades? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ListTrades? onComplete,
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
                    data == null ? null : _parserFn$Query$ListTrades(data),
                  ),
          onError: onError,
          document: documentNodeQueryListTrades,
          parserFn: _parserFn$Query$ListTrades,
        );

  final OnQueryComplete$Query$ListTrades? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ListTrades
    extends graphql.WatchQueryOptions<Query$ListTrades> {
  WatchOptions$Query$ListTrades({
    String? operationName,
    required Variables$Query$ListTrades variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListTrades? typedOptimisticResult,
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
          document: documentNodeQueryListTrades,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ListTrades,
        );
}

class FetchMoreOptions$Query$ListTrades extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ListTrades({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ListTrades variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryListTrades,
        );
}

extension ClientExtension$Query$ListTrades on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ListTrades>> query$ListTrades(
          Options$Query$ListTrades options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$ListTrades> watchQuery$ListTrades(
          WatchOptions$Query$ListTrades options) =>
      this.watchQuery(options);
  void writeQuery$ListTrades({
    required Query$ListTrades data,
    required Variables$Query$ListTrades variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryListTrades),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ListTrades? readQuery$ListTrades({
    required Variables$Query$ListTrades variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryListTrades),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ListTrades.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ListTrades> useQuery$ListTrades(
        Options$Query$ListTrades options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ListTrades> useWatchQuery$ListTrades(
        WatchOptions$Query$ListTrades options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ListTrades$Widget extends graphql_flutter.Query<Query$ListTrades> {
  Query$ListTrades$Widget({
    widgets.Key? key,
    required Options$Query$ListTrades options,
    required graphql_flutter.QueryBuilder<Query$ListTrades> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ListTrades$trades {
  Query$ListTrades$trades({
    required this.id,
    required this.accountAddress,
    required this.type,
    required this.tokenAmount,
    required this.ethAmount,
    required this.createdAt,
    this.$__typename = 'Trade',
  });

  factory Query$ListTrades$trades.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accountAddress = json['accountAddress'];
    final l$type = json['type'];
    final l$tokenAmount = json['tokenAmount'];
    final l$ethAmount = json['ethAmount'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$ListTrades$trades(
      id: (l$id as String),
      accountAddress: (l$accountAddress as String),
      type: fromJson$Enum$TradeType((l$type as String)),
      tokenAmount: decimalFromJson(l$tokenAmount),
      ethAmount: decimalFromJson(l$ethAmount),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String accountAddress;

  final Enum$TradeType type;

  final Decimal tokenAmount;

  final Decimal ethAmount;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accountAddress = accountAddress;
    _resultData['accountAddress'] = l$accountAddress;
    final l$type = type;
    _resultData['type'] = toJson$Enum$TradeType(l$type);
    final l$tokenAmount = tokenAmount;
    _resultData['tokenAmount'] = decimalToJson(l$tokenAmount);
    final l$ethAmount = ethAmount;
    _resultData['ethAmount'] = decimalToJson(l$ethAmount);
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
    final l$type = type;
    final l$tokenAmount = tokenAmount;
    final l$ethAmount = ethAmount;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$accountAddress,
      l$type,
      l$tokenAmount,
      l$ethAmount,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListTrades$trades || runtimeType != other.runtimeType) {
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$tokenAmount = tokenAmount;
    final lOther$tokenAmount = other.tokenAmount;
    if (l$tokenAmount != lOther$tokenAmount) {
      return false;
    }
    final l$ethAmount = ethAmount;
    final lOther$ethAmount = other.ethAmount;
    if (l$ethAmount != lOther$ethAmount) {
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

extension UtilityExtension$Query$ListTrades$trades on Query$ListTrades$trades {
  CopyWith$Query$ListTrades$trades<Query$ListTrades$trades> get copyWith =>
      CopyWith$Query$ListTrades$trades(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ListTrades$trades<TRes> {
  factory CopyWith$Query$ListTrades$trades(
    Query$ListTrades$trades instance,
    TRes Function(Query$ListTrades$trades) then,
  ) = _CopyWithImpl$Query$ListTrades$trades;

  factory CopyWith$Query$ListTrades$trades.stub(TRes res) =
      _CopyWithStubImpl$Query$ListTrades$trades;

  TRes call({
    String? id,
    String? accountAddress,
    Enum$TradeType? type,
    Decimal? tokenAmount,
    Decimal? ethAmount,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ListTrades$trades<TRes>
    implements CopyWith$Query$ListTrades$trades<TRes> {
  _CopyWithImpl$Query$ListTrades$trades(
    this._instance,
    this._then,
  );

  final Query$ListTrades$trades _instance;

  final TRes Function(Query$ListTrades$trades) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? accountAddress = _undefined,
    Object? type = _undefined,
    Object? tokenAmount = _undefined,
    Object? ethAmount = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ListTrades$trades(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        accountAddress: accountAddress == _undefined || accountAddress == null
            ? _instance.accountAddress
            : (accountAddress as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$TradeType),
        tokenAmount: tokenAmount == _undefined || tokenAmount == null
            ? _instance.tokenAmount
            : (tokenAmount as Decimal),
        ethAmount: ethAmount == _undefined || ethAmount == null
            ? _instance.ethAmount
            : (ethAmount as Decimal),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ListTrades$trades<TRes>
    implements CopyWith$Query$ListTrades$trades<TRes> {
  _CopyWithStubImpl$Query$ListTrades$trades(this._res);

  TRes _res;

  call({
    String? id,
    String? accountAddress,
    Enum$TradeType? type,
    Decimal? tokenAmount,
    Decimal? ethAmount,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}
