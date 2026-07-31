import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:tokenzyme_mobile/graphql/scalars.dart';
import 'schema.graphql.dart';

class Query$GetTokenLogoUploadUrl {
  Query$GetTokenLogoUploadUrl({
    required this.tokenLogoUploadUrl,
    this.$__typename = 'Query',
  });

  factory Query$GetTokenLogoUploadUrl.fromJson(Map<String, dynamic> json) {
    final l$tokenLogoUploadUrl = json['tokenLogoUploadUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetTokenLogoUploadUrl(
      tokenLogoUploadUrl:
          Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl.fromJson(
            (l$tokenLogoUploadUrl as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl tokenLogoUploadUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$tokenLogoUploadUrl = tokenLogoUploadUrl;
    _resultData['tokenLogoUploadUrl'] = l$tokenLogoUploadUrl.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$tokenLogoUploadUrl = tokenLogoUploadUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([l$tokenLogoUploadUrl, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetTokenLogoUploadUrl ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$tokenLogoUploadUrl = tokenLogoUploadUrl;
    final lOther$tokenLogoUploadUrl = other.tokenLogoUploadUrl;
    if (l$tokenLogoUploadUrl != lOther$tokenLogoUploadUrl) {
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

extension UtilityExtension$Query$GetTokenLogoUploadUrl
    on Query$GetTokenLogoUploadUrl {
  CopyWith$Query$GetTokenLogoUploadUrl<Query$GetTokenLogoUploadUrl>
  get copyWith => CopyWith$Query$GetTokenLogoUploadUrl(this, (i) => i);
}

abstract class CopyWith$Query$GetTokenLogoUploadUrl<TRes> {
  factory CopyWith$Query$GetTokenLogoUploadUrl(
    Query$GetTokenLogoUploadUrl instance,
    TRes Function(Query$GetTokenLogoUploadUrl) then,
  ) = _CopyWithImpl$Query$GetTokenLogoUploadUrl;

  factory CopyWith$Query$GetTokenLogoUploadUrl.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTokenLogoUploadUrl;

  TRes call({
    Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl? tokenLogoUploadUrl,
    String? $__typename,
  });
  CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes>
  get tokenLogoUploadUrl;
}

class _CopyWithImpl$Query$GetTokenLogoUploadUrl<TRes>
    implements CopyWith$Query$GetTokenLogoUploadUrl<TRes> {
  _CopyWithImpl$Query$GetTokenLogoUploadUrl(this._instance, this._then);

  final Query$GetTokenLogoUploadUrl _instance;

  final TRes Function(Query$GetTokenLogoUploadUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tokenLogoUploadUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetTokenLogoUploadUrl(
      tokenLogoUploadUrl:
          tokenLogoUploadUrl == _undefined || tokenLogoUploadUrl == null
          ? _instance.tokenLogoUploadUrl
          : (tokenLogoUploadUrl
                as Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes>
  get tokenLogoUploadUrl {
    final local$tokenLogoUploadUrl = _instance.tokenLogoUploadUrl;
    return CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(
      local$tokenLogoUploadUrl,
      (e) => call(tokenLogoUploadUrl: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetTokenLogoUploadUrl<TRes>
    implements CopyWith$Query$GetTokenLogoUploadUrl<TRes> {
  _CopyWithStubImpl$Query$GetTokenLogoUploadUrl(this._res);

  TRes _res;

  call({
    Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl? tokenLogoUploadUrl,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes>
  get tokenLogoUploadUrl =>
      CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl.stub(_res);
}

const documentNodeQueryGetTokenLogoUploadUrl = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetTokenLogoUploadUrl'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'tokenLogoUploadUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'uploadUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cdnUrl'),
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
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$GetTokenLogoUploadUrl _parserFn$Query$GetTokenLogoUploadUrl(
  Map<String, dynamic> data,
) => Query$GetTokenLogoUploadUrl.fromJson(data);
typedef OnQueryComplete$Query$GetTokenLogoUploadUrl =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$GetTokenLogoUploadUrl?,
    );

class Options$Query$GetTokenLogoUploadUrl
    extends graphql.QueryOptions<Query$GetTokenLogoUploadUrl> {
  Options$Query$GetTokenLogoUploadUrl({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTokenLogoUploadUrl? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetTokenLogoUploadUrl? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
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
                 data == null
                     ? null
                     : _parserFn$Query$GetTokenLogoUploadUrl(data),
               ),
         onError: onError,
         document: documentNodeQueryGetTokenLogoUploadUrl,
         parserFn: _parserFn$Query$GetTokenLogoUploadUrl,
       );

  final OnQueryComplete$Query$GetTokenLogoUploadUrl? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetTokenLogoUploadUrl
    extends graphql.WatchQueryOptions<Query$GetTokenLogoUploadUrl> {
  WatchOptions$Query$GetTokenLogoUploadUrl({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTokenLogoUploadUrl? typedOptimisticResult,
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
         document: documentNodeQueryGetTokenLogoUploadUrl,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetTokenLogoUploadUrl,
       );
}

class FetchMoreOptions$Query$GetTokenLogoUploadUrl
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetTokenLogoUploadUrl({
    required graphql.UpdateQuery updateQuery,
  }) : super(
         updateQuery: updateQuery,
         document: documentNodeQueryGetTokenLogoUploadUrl,
       );
}

extension ClientExtension$Query$GetTokenLogoUploadUrl on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetTokenLogoUploadUrl>>
  query$GetTokenLogoUploadUrl([
    Options$Query$GetTokenLogoUploadUrl? options,
  ]) async =>
      await this.query(options ?? Options$Query$GetTokenLogoUploadUrl());

  graphql.ObservableQuery<Query$GetTokenLogoUploadUrl>
  watchQuery$GetTokenLogoUploadUrl([
    WatchOptions$Query$GetTokenLogoUploadUrl? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetTokenLogoUploadUrl());

  void writeQuery$GetTokenLogoUploadUrl({
    required Query$GetTokenLogoUploadUrl data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetTokenLogoUploadUrl,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetTokenLogoUploadUrl? readQuery$GetTokenLogoUploadUrl({
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetTokenLogoUploadUrl,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetTokenLogoUploadUrl.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetTokenLogoUploadUrl>
useQuery$GetTokenLogoUploadUrl([
  Options$Query$GetTokenLogoUploadUrl? options,
]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetTokenLogoUploadUrl());
graphql.ObservableQuery<Query$GetTokenLogoUploadUrl>
useWatchQuery$GetTokenLogoUploadUrl([
  WatchOptions$Query$GetTokenLogoUploadUrl? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetTokenLogoUploadUrl(),
);

class Query$GetTokenLogoUploadUrl$Widget
    extends graphql_flutter.Query<Query$GetTokenLogoUploadUrl> {
  Query$GetTokenLogoUploadUrl$Widget({
    widgets.Key? key,
    Options$Query$GetTokenLogoUploadUrl? options,
    required graphql_flutter.QueryBuilder<Query$GetTokenLogoUploadUrl> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetTokenLogoUploadUrl(),
         builder: builder,
       );
}

class Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl {
  Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl({
    required this.uploadUrl,
    required this.cdnUrl,
    this.$__typename = 'UploadSignedUrl',
  });

  factory Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$uploadUrl = json['uploadUrl'];
    final l$cdnUrl = json['cdnUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(
      uploadUrl: (l$uploadUrl as String),
      cdnUrl: (l$cdnUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String uploadUrl;

  final String cdnUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$uploadUrl = uploadUrl;
    _resultData['uploadUrl'] = l$uploadUrl;
    final l$cdnUrl = cdnUrl;
    _resultData['cdnUrl'] = l$cdnUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$uploadUrl = uploadUrl;
    final l$cdnUrl = cdnUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([l$uploadUrl, l$cdnUrl, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$uploadUrl = uploadUrl;
    final lOther$uploadUrl = other.uploadUrl;
    if (l$uploadUrl != lOther$uploadUrl) {
      return false;
    }
    final l$cdnUrl = cdnUrl;
    final lOther$cdnUrl = other.cdnUrl;
    if (l$cdnUrl != lOther$cdnUrl) {
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

extension UtilityExtension$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl
    on Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl {
  CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<
    Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl
  >
  get copyWith =>
      CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(this, (i) => i);
}

abstract class CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes> {
  factory CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(
    Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl instance,
    TRes Function(Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl) then,
  ) = _CopyWithImpl$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl;

  factory CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl;

  TRes call({String? uploadUrl, String? cdnUrl, String? $__typename});
}

class _CopyWithImpl$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes>
    implements CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes> {
  _CopyWithImpl$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(
    this._instance,
    this._then,
  );

  final Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl _instance;

  final TRes Function(Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? uploadUrl = _undefined,
    Object? cdnUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(
      uploadUrl: uploadUrl == _undefined || uploadUrl == null
          ? _instance.uploadUrl
          : (uploadUrl as String),
      cdnUrl: cdnUrl == _undefined || cdnUrl == null
          ? _instance.cdnUrl
          : (cdnUrl as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes>
    implements CopyWith$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl<TRes> {
  _CopyWithStubImpl$Query$GetTokenLogoUploadUrl$tokenLogoUploadUrl(this._res);

  TRes _res;

  call({String? uploadUrl, String? cdnUrl, String? $__typename}) => _res;
}

class Variables$Query$IsTokenRegistered {
  factory Variables$Query$IsTokenRegistered({required String address}) =>
      Variables$Query$IsTokenRegistered._({r'address': address});

  Variables$Query$IsTokenRegistered._(this._$data);

  factory Variables$Query$IsTokenRegistered.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$address = data['address'];
    result$data['address'] = (l$address as String);
    return Variables$Query$IsTokenRegistered._(result$data);
  }

  Map<String, dynamic> _$data;

  String get address => (_$data['address'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$address = address;
    result$data['address'] = l$address;
    return result$data;
  }

  CopyWith$Variables$Query$IsTokenRegistered<Variables$Query$IsTokenRegistered>
  get copyWith => CopyWith$Variables$Query$IsTokenRegistered(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$IsTokenRegistered ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$address = address;
    return Object.hashAll([l$address]);
  }
}

abstract class CopyWith$Variables$Query$IsTokenRegistered<TRes> {
  factory CopyWith$Variables$Query$IsTokenRegistered(
    Variables$Query$IsTokenRegistered instance,
    TRes Function(Variables$Query$IsTokenRegistered) then,
  ) = _CopyWithImpl$Variables$Query$IsTokenRegistered;

  factory CopyWith$Variables$Query$IsTokenRegistered.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$IsTokenRegistered;

  TRes call({String? address});
}

class _CopyWithImpl$Variables$Query$IsTokenRegistered<TRes>
    implements CopyWith$Variables$Query$IsTokenRegistered<TRes> {
  _CopyWithImpl$Variables$Query$IsTokenRegistered(this._instance, this._then);

  final Variables$Query$IsTokenRegistered _instance;

  final TRes Function(Variables$Query$IsTokenRegistered) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? address = _undefined}) => _then(
    Variables$Query$IsTokenRegistered._({
      ..._instance._$data,
      if (address != _undefined && address != null)
        'address': (address as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$IsTokenRegistered<TRes>
    implements CopyWith$Variables$Query$IsTokenRegistered<TRes> {
  _CopyWithStubImpl$Variables$Query$IsTokenRegistered(this._res);

  TRes _res;

  call({String? address}) => _res;
}

class Query$IsTokenRegistered {
  Query$IsTokenRegistered({
    required this.isTokenRegistered,
    this.$__typename = 'Query',
  });

  factory Query$IsTokenRegistered.fromJson(Map<String, dynamic> json) {
    final l$isTokenRegistered = json['isTokenRegistered'];
    final l$$__typename = json['__typename'];
    return Query$IsTokenRegistered(
      isTokenRegistered: (l$isTokenRegistered as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool isTokenRegistered;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$isTokenRegistered = isTokenRegistered;
    _resultData['isTokenRegistered'] = l$isTokenRegistered;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$isTokenRegistered = isTokenRegistered;
    final l$$__typename = $__typename;
    return Object.hashAll([l$isTokenRegistered, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$IsTokenRegistered || runtimeType != other.runtimeType) {
      return false;
    }
    final l$isTokenRegistered = isTokenRegistered;
    final lOther$isTokenRegistered = other.isTokenRegistered;
    if (l$isTokenRegistered != lOther$isTokenRegistered) {
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

extension UtilityExtension$Query$IsTokenRegistered on Query$IsTokenRegistered {
  CopyWith$Query$IsTokenRegistered<Query$IsTokenRegistered> get copyWith =>
      CopyWith$Query$IsTokenRegistered(this, (i) => i);
}

abstract class CopyWith$Query$IsTokenRegistered<TRes> {
  factory CopyWith$Query$IsTokenRegistered(
    Query$IsTokenRegistered instance,
    TRes Function(Query$IsTokenRegistered) then,
  ) = _CopyWithImpl$Query$IsTokenRegistered;

  factory CopyWith$Query$IsTokenRegistered.stub(TRes res) =
      _CopyWithStubImpl$Query$IsTokenRegistered;

  TRes call({bool? isTokenRegistered, String? $__typename});
}

class _CopyWithImpl$Query$IsTokenRegistered<TRes>
    implements CopyWith$Query$IsTokenRegistered<TRes> {
  _CopyWithImpl$Query$IsTokenRegistered(this._instance, this._then);

  final Query$IsTokenRegistered _instance;

  final TRes Function(Query$IsTokenRegistered) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? isTokenRegistered = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$IsTokenRegistered(
      isTokenRegistered:
          isTokenRegistered == _undefined || isTokenRegistered == null
          ? _instance.isTokenRegistered
          : (isTokenRegistered as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$IsTokenRegistered<TRes>
    implements CopyWith$Query$IsTokenRegistered<TRes> {
  _CopyWithStubImpl$Query$IsTokenRegistered(this._res);

  TRes _res;

  call({bool? isTokenRegistered, String? $__typename}) => _res;
}

const documentNodeQueryIsTokenRegistered = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'IsTokenRegistered'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'address')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'isTokenRegistered'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'address'),
                value: VariableNode(name: NameNode(value: 'address')),
              ),
            ],
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
        ],
      ),
    ),
  ],
);
Query$IsTokenRegistered _parserFn$Query$IsTokenRegistered(
  Map<String, dynamic> data,
) => Query$IsTokenRegistered.fromJson(data);
typedef OnQueryComplete$Query$IsTokenRegistered =
    FutureOr<void> Function(Map<String, dynamic>?, Query$IsTokenRegistered?);

class Options$Query$IsTokenRegistered
    extends graphql.QueryOptions<Query$IsTokenRegistered> {
  Options$Query$IsTokenRegistered({
    String? operationName,
    required Variables$Query$IsTokenRegistered variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$IsTokenRegistered? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$IsTokenRegistered? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
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
                 data == null ? null : _parserFn$Query$IsTokenRegistered(data),
               ),
         onError: onError,
         document: documentNodeQueryIsTokenRegistered,
         parserFn: _parserFn$Query$IsTokenRegistered,
       );

  final OnQueryComplete$Query$IsTokenRegistered? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$IsTokenRegistered
    extends graphql.WatchQueryOptions<Query$IsTokenRegistered> {
  WatchOptions$Query$IsTokenRegistered({
    String? operationName,
    required Variables$Query$IsTokenRegistered variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$IsTokenRegistered? typedOptimisticResult,
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
         document: documentNodeQueryIsTokenRegistered,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$IsTokenRegistered,
       );
}

class FetchMoreOptions$Query$IsTokenRegistered
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$IsTokenRegistered({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$IsTokenRegistered variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryIsTokenRegistered,
       );
}

extension ClientExtension$Query$IsTokenRegistered on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$IsTokenRegistered>> query$IsTokenRegistered(
    Options$Query$IsTokenRegistered options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$IsTokenRegistered> watchQuery$IsTokenRegistered(
    WatchOptions$Query$IsTokenRegistered options,
  ) => this.watchQuery(options);

  void writeQuery$IsTokenRegistered({
    required Query$IsTokenRegistered data,
    required Variables$Query$IsTokenRegistered variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryIsTokenRegistered,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$IsTokenRegistered? readQuery$IsTokenRegistered({
    required Variables$Query$IsTokenRegistered variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryIsTokenRegistered,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$IsTokenRegistered.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$IsTokenRegistered>
useQuery$IsTokenRegistered(Options$Query$IsTokenRegistered options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$IsTokenRegistered>
useWatchQuery$IsTokenRegistered(WatchOptions$Query$IsTokenRegistered options) =>
    graphql_flutter.useWatchQuery(options);

class Query$IsTokenRegistered$Widget
    extends graphql_flutter.Query<Query$IsTokenRegistered> {
  Query$IsTokenRegistered$Widget({
    widgets.Key? key,
    required Options$Query$IsTokenRegistered options,
    required graphql_flutter.QueryBuilder<Query$IsTokenRegistered> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Query$GetToken {
  factory Variables$Query$GetToken({required String address}) =>
      Variables$Query$GetToken._({r'address': address});

  Variables$Query$GetToken._(this._$data);

  factory Variables$Query$GetToken.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$address = data['address'];
    result$data['address'] = (l$address as String);
    return Variables$Query$GetToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get address => (_$data['address'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$address = address;
    result$data['address'] = l$address;
    return result$data;
  }

  CopyWith$Variables$Query$GetToken<Variables$Query$GetToken> get copyWith =>
      CopyWith$Variables$Query$GetToken(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetToken ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$address = address;
    return Object.hashAll([l$address]);
  }
}

abstract class CopyWith$Variables$Query$GetToken<TRes> {
  factory CopyWith$Variables$Query$GetToken(
    Variables$Query$GetToken instance,
    TRes Function(Variables$Query$GetToken) then,
  ) = _CopyWithImpl$Variables$Query$GetToken;

  factory CopyWith$Variables$Query$GetToken.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetToken;

  TRes call({String? address});
}

class _CopyWithImpl$Variables$Query$GetToken<TRes>
    implements CopyWith$Variables$Query$GetToken<TRes> {
  _CopyWithImpl$Variables$Query$GetToken(this._instance, this._then);

  final Variables$Query$GetToken _instance;

  final TRes Function(Variables$Query$GetToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? address = _undefined}) => _then(
    Variables$Query$GetToken._({
      ..._instance._$data,
      if (address != _undefined && address != null)
        'address': (address as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetToken<TRes>
    implements CopyWith$Variables$Query$GetToken<TRes> {
  _CopyWithStubImpl$Variables$Query$GetToken(this._res);

  TRes _res;

  call({String? address}) => _res;
}

class Query$GetToken {
  Query$GetToken({required this.token, this.$__typename = 'Query'});

  factory Query$GetToken.fromJson(Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Query$GetToken(
      token: Query$GetToken$token.fromJson((l$token as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetToken$token token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([l$token, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetToken || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
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

extension UtilityExtension$Query$GetToken on Query$GetToken {
  CopyWith$Query$GetToken<Query$GetToken> get copyWith =>
      CopyWith$Query$GetToken(this, (i) => i);
}

abstract class CopyWith$Query$GetToken<TRes> {
  factory CopyWith$Query$GetToken(
    Query$GetToken instance,
    TRes Function(Query$GetToken) then,
  ) = _CopyWithImpl$Query$GetToken;

  factory CopyWith$Query$GetToken.stub(TRes res) =
      _CopyWithStubImpl$Query$GetToken;

  TRes call({Query$GetToken$token? token, String? $__typename});
  CopyWith$Query$GetToken$token<TRes> get token;
}

class _CopyWithImpl$Query$GetToken<TRes>
    implements CopyWith$Query$GetToken<TRes> {
  _CopyWithImpl$Query$GetToken(this._instance, this._then);

  final Query$GetToken _instance;

  final TRes Function(Query$GetToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? token = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetToken(
          token: token == _undefined || token == null
              ? _instance.token
              : (token as Query$GetToken$token),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetToken$token<TRes> get token {
    final local$token = _instance.token;
    return CopyWith$Query$GetToken$token(local$token, (e) => call(token: e));
  }
}

class _CopyWithStubImpl$Query$GetToken<TRes>
    implements CopyWith$Query$GetToken<TRes> {
  _CopyWithStubImpl$Query$GetToken(this._res);

  TRes _res;

  call({Query$GetToken$token? token, String? $__typename}) => _res;

  CopyWith$Query$GetToken$token<TRes> get token =>
      CopyWith$Query$GetToken$token.stub(_res);
}

const documentNodeQueryGetToken = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetToken'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'address')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'address'),
                value: VariableNode(name: NameNode(value: 'address')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'address'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'creatorAddress'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'symbol'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'logoUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'websiteUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'totalSupply'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'bondingCurveSupply'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'ethReserve'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'reserve'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'finalPrice'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dexPoolAddress'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'migratedAt'),
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
                  name: NameNode(value: 'tradesCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'commentsCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'socialMedia'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'xUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'telegramUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'discordUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'redditUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'facebookUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'instagramUrl'),
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
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$GetToken _parserFn$Query$GetToken(Map<String, dynamic> data) =>
    Query$GetToken.fromJson(data);
typedef OnQueryComplete$Query$GetToken =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetToken?);

class Options$Query$GetToken extends graphql.QueryOptions<Query$GetToken> {
  Options$Query$GetToken({
    String? operationName,
    required Variables$Query$GetToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetToken? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetToken? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
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
                 data == null ? null : _parserFn$Query$GetToken(data),
               ),
         onError: onError,
         document: documentNodeQueryGetToken,
         parserFn: _parserFn$Query$GetToken,
       );

  final OnQueryComplete$Query$GetToken? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetToken
    extends graphql.WatchQueryOptions<Query$GetToken> {
  WatchOptions$Query$GetToken({
    String? operationName,
    required Variables$Query$GetToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetToken? typedOptimisticResult,
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
         document: documentNodeQueryGetToken,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetToken,
       );
}

class FetchMoreOptions$Query$GetToken extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetToken({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetToken variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetToken,
       );
}

extension ClientExtension$Query$GetToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetToken>> query$GetToken(
    Options$Query$GetToken options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetToken> watchQuery$GetToken(
    WatchOptions$Query$GetToken options,
  ) => this.watchQuery(options);

  void writeQuery$GetToken({
    required Query$GetToken data,
    required Variables$Query$GetToken variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetToken),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetToken? readQuery$GetToken({
    required Variables$Query$GetToken variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetToken),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetToken.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetToken> useQuery$GetToken(
  Options$Query$GetToken options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetToken> useWatchQuery$GetToken(
  WatchOptions$Query$GetToken options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetToken$Widget extends graphql_flutter.Query<Query$GetToken> {
  Query$GetToken$Widget({
    widgets.Key? key,
    required Options$Query$GetToken options,
    required graphql_flutter.QueryBuilder<Query$GetToken> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetToken$token {
  Query$GetToken$token({
    required this.address,
    required this.creatorAddress,
    required this.name,
    required this.symbol,
    required this.description,
    required this.logoUrl,
    this.websiteUrl,
    required this.totalSupply,
    required this.bondingCurveSupply,
    required this.ethReserve,
    required this.reserve,
    required this.price,
    required this.finalPrice,
    this.dexPoolAddress,
    this.migratedAt,
    required this.createdAt,
    required this.tradesCount,
    required this.commentsCount,
    this.socialMedia,
    this.$__typename = 'Token',
  });

  factory Query$GetToken$token.fromJson(Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$creatorAddress = json['creatorAddress'];
    final l$name = json['name'];
    final l$symbol = json['symbol'];
    final l$description = json['description'];
    final l$logoUrl = json['logoUrl'];
    final l$websiteUrl = json['websiteUrl'];
    final l$totalSupply = json['totalSupply'];
    final l$bondingCurveSupply = json['bondingCurveSupply'];
    final l$ethReserve = json['ethReserve'];
    final l$reserve = json['reserve'];
    final l$price = json['price'];
    final l$finalPrice = json['finalPrice'];
    final l$dexPoolAddress = json['dexPoolAddress'];
    final l$migratedAt = json['migratedAt'];
    final l$createdAt = json['createdAt'];
    final l$tradesCount = json['tradesCount'];
    final l$commentsCount = json['commentsCount'];
    final l$socialMedia = json['socialMedia'];
    final l$$__typename = json['__typename'];
    return Query$GetToken$token(
      address: (l$address as String),
      creatorAddress: (l$creatorAddress as String),
      name: (l$name as String),
      symbol: (l$symbol as String),
      description: (l$description as String),
      logoUrl: (l$logoUrl as String),
      websiteUrl: (l$websiteUrl as String?),
      totalSupply: decimalFromJson(l$totalSupply),
      bondingCurveSupply: decimalFromJson(l$bondingCurveSupply),
      ethReserve: decimalFromJson(l$ethReserve),
      reserve: decimalFromJson(l$reserve),
      price: decimalFromJson(l$price),
      finalPrice: decimalFromJson(l$finalPrice),
      dexPoolAddress: (l$dexPoolAddress as String?),
      migratedAt: l$migratedAt == null ? null : dateTimeFromJson(l$migratedAt),
      createdAt: dateTimeFromJson(l$createdAt),
      tradesCount: (l$tradesCount as int),
      commentsCount: (l$commentsCount as int),
      socialMedia: l$socialMedia == null
          ? null
          : Query$GetToken$token$socialMedia.fromJson(
              (l$socialMedia as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String address;

  final String creatorAddress;

  final String name;

  final String symbol;

  final String description;

  final String logoUrl;

  final String? websiteUrl;

  final Decimal totalSupply;

  final Decimal bondingCurveSupply;

  final Decimal ethReserve;

  final Decimal reserve;

  final Decimal price;

  final Decimal finalPrice;

  final String? dexPoolAddress;

  final DateTime? migratedAt;

  final DateTime createdAt;

  final int tradesCount;

  final int commentsCount;

  final Query$GetToken$token$socialMedia? socialMedia;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$creatorAddress = creatorAddress;
    _resultData['creatorAddress'] = l$creatorAddress;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$symbol = symbol;
    _resultData['symbol'] = l$symbol;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$logoUrl = logoUrl;
    _resultData['logoUrl'] = l$logoUrl;
    final l$websiteUrl = websiteUrl;
    _resultData['websiteUrl'] = l$websiteUrl;
    final l$totalSupply = totalSupply;
    _resultData['totalSupply'] = decimalToJson(l$totalSupply);
    final l$bondingCurveSupply = bondingCurveSupply;
    _resultData['bondingCurveSupply'] = decimalToJson(l$bondingCurveSupply);
    final l$ethReserve = ethReserve;
    _resultData['ethReserve'] = decimalToJson(l$ethReserve);
    final l$reserve = reserve;
    _resultData['reserve'] = decimalToJson(l$reserve);
    final l$price = price;
    _resultData['price'] = decimalToJson(l$price);
    final l$finalPrice = finalPrice;
    _resultData['finalPrice'] = decimalToJson(l$finalPrice);
    final l$dexPoolAddress = dexPoolAddress;
    _resultData['dexPoolAddress'] = l$dexPoolAddress;
    final l$migratedAt = migratedAt;
    _resultData['migratedAt'] = l$migratedAt == null
        ? null
        : dateTimeToJson(l$migratedAt);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$tradesCount = tradesCount;
    _resultData['tradesCount'] = l$tradesCount;
    final l$commentsCount = commentsCount;
    _resultData['commentsCount'] = l$commentsCount;
    final l$socialMedia = socialMedia;
    _resultData['socialMedia'] = l$socialMedia?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$creatorAddress = creatorAddress;
    final l$name = name;
    final l$symbol = symbol;
    final l$description = description;
    final l$logoUrl = logoUrl;
    final l$websiteUrl = websiteUrl;
    final l$totalSupply = totalSupply;
    final l$bondingCurveSupply = bondingCurveSupply;
    final l$ethReserve = ethReserve;
    final l$reserve = reserve;
    final l$price = price;
    final l$finalPrice = finalPrice;
    final l$dexPoolAddress = dexPoolAddress;
    final l$migratedAt = migratedAt;
    final l$createdAt = createdAt;
    final l$tradesCount = tradesCount;
    final l$commentsCount = commentsCount;
    final l$socialMedia = socialMedia;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$creatorAddress,
      l$name,
      l$symbol,
      l$description,
      l$logoUrl,
      l$websiteUrl,
      l$totalSupply,
      l$bondingCurveSupply,
      l$ethReserve,
      l$reserve,
      l$price,
      l$finalPrice,
      l$dexPoolAddress,
      l$migratedAt,
      l$createdAt,
      l$tradesCount,
      l$commentsCount,
      l$socialMedia,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetToken$token || runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$creatorAddress = creatorAddress;
    final lOther$creatorAddress = other.creatorAddress;
    if (l$creatorAddress != lOther$creatorAddress) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$symbol = symbol;
    final lOther$symbol = other.symbol;
    if (l$symbol != lOther$symbol) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$logoUrl = logoUrl;
    final lOther$logoUrl = other.logoUrl;
    if (l$logoUrl != lOther$logoUrl) {
      return false;
    }
    final l$websiteUrl = websiteUrl;
    final lOther$websiteUrl = other.websiteUrl;
    if (l$websiteUrl != lOther$websiteUrl) {
      return false;
    }
    final l$totalSupply = totalSupply;
    final lOther$totalSupply = other.totalSupply;
    if (l$totalSupply != lOther$totalSupply) {
      return false;
    }
    final l$bondingCurveSupply = bondingCurveSupply;
    final lOther$bondingCurveSupply = other.bondingCurveSupply;
    if (l$bondingCurveSupply != lOther$bondingCurveSupply) {
      return false;
    }
    final l$ethReserve = ethReserve;
    final lOther$ethReserve = other.ethReserve;
    if (l$ethReserve != lOther$ethReserve) {
      return false;
    }
    final l$reserve = reserve;
    final lOther$reserve = other.reserve;
    if (l$reserve != lOther$reserve) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$finalPrice = finalPrice;
    final lOther$finalPrice = other.finalPrice;
    if (l$finalPrice != lOther$finalPrice) {
      return false;
    }
    final l$dexPoolAddress = dexPoolAddress;
    final lOther$dexPoolAddress = other.dexPoolAddress;
    if (l$dexPoolAddress != lOther$dexPoolAddress) {
      return false;
    }
    final l$migratedAt = migratedAt;
    final lOther$migratedAt = other.migratedAt;
    if (l$migratedAt != lOther$migratedAt) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$tradesCount = tradesCount;
    final lOther$tradesCount = other.tradesCount;
    if (l$tradesCount != lOther$tradesCount) {
      return false;
    }
    final l$commentsCount = commentsCount;
    final lOther$commentsCount = other.commentsCount;
    if (l$commentsCount != lOther$commentsCount) {
      return false;
    }
    final l$socialMedia = socialMedia;
    final lOther$socialMedia = other.socialMedia;
    if (l$socialMedia != lOther$socialMedia) {
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

extension UtilityExtension$Query$GetToken$token on Query$GetToken$token {
  CopyWith$Query$GetToken$token<Query$GetToken$token> get copyWith =>
      CopyWith$Query$GetToken$token(this, (i) => i);
}

abstract class CopyWith$Query$GetToken$token<TRes> {
  factory CopyWith$Query$GetToken$token(
    Query$GetToken$token instance,
    TRes Function(Query$GetToken$token) then,
  ) = _CopyWithImpl$Query$GetToken$token;

  factory CopyWith$Query$GetToken$token.stub(TRes res) =
      _CopyWithStubImpl$Query$GetToken$token;

  TRes call({
    String? address,
    String? creatorAddress,
    String? name,
    String? symbol,
    String? description,
    String? logoUrl,
    String? websiteUrl,
    Decimal? totalSupply,
    Decimal? bondingCurveSupply,
    Decimal? ethReserve,
    Decimal? reserve,
    Decimal? price,
    Decimal? finalPrice,
    String? dexPoolAddress,
    DateTime? migratedAt,
    DateTime? createdAt,
    int? tradesCount,
    int? commentsCount,
    Query$GetToken$token$socialMedia? socialMedia,
    String? $__typename,
  });
  CopyWith$Query$GetToken$token$socialMedia<TRes> get socialMedia;
}

class _CopyWithImpl$Query$GetToken$token<TRes>
    implements CopyWith$Query$GetToken$token<TRes> {
  _CopyWithImpl$Query$GetToken$token(this._instance, this._then);

  final Query$GetToken$token _instance;

  final TRes Function(Query$GetToken$token) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? address = _undefined,
    Object? creatorAddress = _undefined,
    Object? name = _undefined,
    Object? symbol = _undefined,
    Object? description = _undefined,
    Object? logoUrl = _undefined,
    Object? websiteUrl = _undefined,
    Object? totalSupply = _undefined,
    Object? bondingCurveSupply = _undefined,
    Object? ethReserve = _undefined,
    Object? reserve = _undefined,
    Object? price = _undefined,
    Object? finalPrice = _undefined,
    Object? dexPoolAddress = _undefined,
    Object? migratedAt = _undefined,
    Object? createdAt = _undefined,
    Object? tradesCount = _undefined,
    Object? commentsCount = _undefined,
    Object? socialMedia = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetToken$token(
      address: address == _undefined || address == null
          ? _instance.address
          : (address as String),
      creatorAddress: creatorAddress == _undefined || creatorAddress == null
          ? _instance.creatorAddress
          : (creatorAddress as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      symbol: symbol == _undefined || symbol == null
          ? _instance.symbol
          : (symbol as String),
      description: description == _undefined || description == null
          ? _instance.description
          : (description as String),
      logoUrl: logoUrl == _undefined || logoUrl == null
          ? _instance.logoUrl
          : (logoUrl as String),
      websiteUrl: websiteUrl == _undefined
          ? _instance.websiteUrl
          : (websiteUrl as String?),
      totalSupply: totalSupply == _undefined || totalSupply == null
          ? _instance.totalSupply
          : (totalSupply as Decimal),
      bondingCurveSupply:
          bondingCurveSupply == _undefined || bondingCurveSupply == null
          ? _instance.bondingCurveSupply
          : (bondingCurveSupply as Decimal),
      ethReserve: ethReserve == _undefined || ethReserve == null
          ? _instance.ethReserve
          : (ethReserve as Decimal),
      reserve: reserve == _undefined || reserve == null
          ? _instance.reserve
          : (reserve as Decimal),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as Decimal),
      finalPrice: finalPrice == _undefined || finalPrice == null
          ? _instance.finalPrice
          : (finalPrice as Decimal),
      dexPoolAddress: dexPoolAddress == _undefined
          ? _instance.dexPoolAddress
          : (dexPoolAddress as String?),
      migratedAt: migratedAt == _undefined
          ? _instance.migratedAt
          : (migratedAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      tradesCount: tradesCount == _undefined || tradesCount == null
          ? _instance.tradesCount
          : (tradesCount as int),
      commentsCount: commentsCount == _undefined || commentsCount == null
          ? _instance.commentsCount
          : (commentsCount as int),
      socialMedia: socialMedia == _undefined
          ? _instance.socialMedia
          : (socialMedia as Query$GetToken$token$socialMedia?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetToken$token$socialMedia<TRes> get socialMedia {
    final local$socialMedia = _instance.socialMedia;
    return local$socialMedia == null
        ? CopyWith$Query$GetToken$token$socialMedia.stub(_then(_instance))
        : CopyWith$Query$GetToken$token$socialMedia(
            local$socialMedia,
            (e) => call(socialMedia: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetToken$token<TRes>
    implements CopyWith$Query$GetToken$token<TRes> {
  _CopyWithStubImpl$Query$GetToken$token(this._res);

  TRes _res;

  call({
    String? address,
    String? creatorAddress,
    String? name,
    String? symbol,
    String? description,
    String? logoUrl,
    String? websiteUrl,
    Decimal? totalSupply,
    Decimal? bondingCurveSupply,
    Decimal? ethReserve,
    Decimal? reserve,
    Decimal? price,
    Decimal? finalPrice,
    String? dexPoolAddress,
    DateTime? migratedAt,
    DateTime? createdAt,
    int? tradesCount,
    int? commentsCount,
    Query$GetToken$token$socialMedia? socialMedia,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetToken$token$socialMedia<TRes> get socialMedia =>
      CopyWith$Query$GetToken$token$socialMedia.stub(_res);
}

class Query$GetToken$token$socialMedia {
  Query$GetToken$token$socialMedia({
    this.xUrl,
    this.telegramUrl,
    this.discordUrl,
    this.redditUrl,
    this.facebookUrl,
    this.instagramUrl,
    this.$__typename = 'SocialMedia',
  });

  factory Query$GetToken$token$socialMedia.fromJson(Map<String, dynamic> json) {
    final l$xUrl = json['xUrl'];
    final l$telegramUrl = json['telegramUrl'];
    final l$discordUrl = json['discordUrl'];
    final l$redditUrl = json['redditUrl'];
    final l$facebookUrl = json['facebookUrl'];
    final l$instagramUrl = json['instagramUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetToken$token$socialMedia(
      xUrl: (l$xUrl as String?),
      telegramUrl: (l$telegramUrl as String?),
      discordUrl: (l$discordUrl as String?),
      redditUrl: (l$redditUrl as String?),
      facebookUrl: (l$facebookUrl as String?),
      instagramUrl: (l$instagramUrl as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? xUrl;

  final String? telegramUrl;

  final String? discordUrl;

  final String? redditUrl;

  final String? facebookUrl;

  final String? instagramUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$xUrl = xUrl;
    _resultData['xUrl'] = l$xUrl;
    final l$telegramUrl = telegramUrl;
    _resultData['telegramUrl'] = l$telegramUrl;
    final l$discordUrl = discordUrl;
    _resultData['discordUrl'] = l$discordUrl;
    final l$redditUrl = redditUrl;
    _resultData['redditUrl'] = l$redditUrl;
    final l$facebookUrl = facebookUrl;
    _resultData['facebookUrl'] = l$facebookUrl;
    final l$instagramUrl = instagramUrl;
    _resultData['instagramUrl'] = l$instagramUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$xUrl = xUrl;
    final l$telegramUrl = telegramUrl;
    final l$discordUrl = discordUrl;
    final l$redditUrl = redditUrl;
    final l$facebookUrl = facebookUrl;
    final l$instagramUrl = instagramUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$xUrl,
      l$telegramUrl,
      l$discordUrl,
      l$redditUrl,
      l$facebookUrl,
      l$instagramUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetToken$token$socialMedia ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$xUrl = xUrl;
    final lOther$xUrl = other.xUrl;
    if (l$xUrl != lOther$xUrl) {
      return false;
    }
    final l$telegramUrl = telegramUrl;
    final lOther$telegramUrl = other.telegramUrl;
    if (l$telegramUrl != lOther$telegramUrl) {
      return false;
    }
    final l$discordUrl = discordUrl;
    final lOther$discordUrl = other.discordUrl;
    if (l$discordUrl != lOther$discordUrl) {
      return false;
    }
    final l$redditUrl = redditUrl;
    final lOther$redditUrl = other.redditUrl;
    if (l$redditUrl != lOther$redditUrl) {
      return false;
    }
    final l$facebookUrl = facebookUrl;
    final lOther$facebookUrl = other.facebookUrl;
    if (l$facebookUrl != lOther$facebookUrl) {
      return false;
    }
    final l$instagramUrl = instagramUrl;
    final lOther$instagramUrl = other.instagramUrl;
    if (l$instagramUrl != lOther$instagramUrl) {
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

extension UtilityExtension$Query$GetToken$token$socialMedia
    on Query$GetToken$token$socialMedia {
  CopyWith$Query$GetToken$token$socialMedia<Query$GetToken$token$socialMedia>
  get copyWith => CopyWith$Query$GetToken$token$socialMedia(this, (i) => i);
}

abstract class CopyWith$Query$GetToken$token$socialMedia<TRes> {
  factory CopyWith$Query$GetToken$token$socialMedia(
    Query$GetToken$token$socialMedia instance,
    TRes Function(Query$GetToken$token$socialMedia) then,
  ) = _CopyWithImpl$Query$GetToken$token$socialMedia;

  factory CopyWith$Query$GetToken$token$socialMedia.stub(TRes res) =
      _CopyWithStubImpl$Query$GetToken$token$socialMedia;

  TRes call({
    String? xUrl,
    String? telegramUrl,
    String? discordUrl,
    String? redditUrl,
    String? facebookUrl,
    String? instagramUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetToken$token$socialMedia<TRes>
    implements CopyWith$Query$GetToken$token$socialMedia<TRes> {
  _CopyWithImpl$Query$GetToken$token$socialMedia(this._instance, this._then);

  final Query$GetToken$token$socialMedia _instance;

  final TRes Function(Query$GetToken$token$socialMedia) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? xUrl = _undefined,
    Object? telegramUrl = _undefined,
    Object? discordUrl = _undefined,
    Object? redditUrl = _undefined,
    Object? facebookUrl = _undefined,
    Object? instagramUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetToken$token$socialMedia(
      xUrl: xUrl == _undefined ? _instance.xUrl : (xUrl as String?),
      telegramUrl: telegramUrl == _undefined
          ? _instance.telegramUrl
          : (telegramUrl as String?),
      discordUrl: discordUrl == _undefined
          ? _instance.discordUrl
          : (discordUrl as String?),
      redditUrl: redditUrl == _undefined
          ? _instance.redditUrl
          : (redditUrl as String?),
      facebookUrl: facebookUrl == _undefined
          ? _instance.facebookUrl
          : (facebookUrl as String?),
      instagramUrl: instagramUrl == _undefined
          ? _instance.instagramUrl
          : (instagramUrl as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetToken$token$socialMedia<TRes>
    implements CopyWith$Query$GetToken$token$socialMedia<TRes> {
  _CopyWithStubImpl$Query$GetToken$token$socialMedia(this._res);

  TRes _res;

  call({
    String? xUrl,
    String? telegramUrl,
    String? discordUrl,
    String? redditUrl,
    String? facebookUrl,
    String? instagramUrl,
    String? $__typename,
  }) => _res;
}

class Variables$Query$ListTokens {
  factory Variables$Query$ListTokens({
    required Enum$TokenSortType sortType,
    int? pageSize,
    String? lastTokenAddress,
  }) => Variables$Query$ListTokens._({
    r'sortType': sortType,
    if (pageSize != null) r'pageSize': pageSize,
    if (lastTokenAddress != null) r'lastTokenAddress': lastTokenAddress,
  });

  Variables$Query$ListTokens._(this._$data);

  factory Variables$Query$ListTokens.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$sortType = data['sortType'];
    result$data['sortType'] = fromJson$Enum$TokenSortType(
      (l$sortType as String),
    );
    if (data.containsKey('pageSize')) {
      final l$pageSize = data['pageSize'];
      result$data['pageSize'] = (l$pageSize as int?);
    }
    if (data.containsKey('lastTokenAddress')) {
      final l$lastTokenAddress = data['lastTokenAddress'];
      result$data['lastTokenAddress'] = (l$lastTokenAddress as String?);
    }
    return Variables$Query$ListTokens._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$TokenSortType get sortType => (_$data['sortType'] as Enum$TokenSortType);

  int? get pageSize => (_$data['pageSize'] as int?);

  String? get lastTokenAddress => (_$data['lastTokenAddress'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$sortType = sortType;
    result$data['sortType'] = toJson$Enum$TokenSortType(l$sortType);
    if (_$data.containsKey('pageSize')) {
      final l$pageSize = pageSize;
      result$data['pageSize'] = l$pageSize;
    }
    if (_$data.containsKey('lastTokenAddress')) {
      final l$lastTokenAddress = lastTokenAddress;
      result$data['lastTokenAddress'] = l$lastTokenAddress;
    }
    return result$data;
  }

  CopyWith$Variables$Query$ListTokens<Variables$Query$ListTokens>
  get copyWith => CopyWith$Variables$Query$ListTokens(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ListTokens ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sortType = sortType;
    final lOther$sortType = other.sortType;
    if (l$sortType != lOther$sortType) {
      return false;
    }
    final l$pageSize = pageSize;
    final lOther$pageSize = other.pageSize;
    if (_$data.containsKey('pageSize') !=
        other._$data.containsKey('pageSize')) {
      return false;
    }
    if (l$pageSize != lOther$pageSize) {
      return false;
    }
    final l$lastTokenAddress = lastTokenAddress;
    final lOther$lastTokenAddress = other.lastTokenAddress;
    if (_$data.containsKey('lastTokenAddress') !=
        other._$data.containsKey('lastTokenAddress')) {
      return false;
    }
    if (l$lastTokenAddress != lOther$lastTokenAddress) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sortType = sortType;
    final l$pageSize = pageSize;
    final l$lastTokenAddress = lastTokenAddress;
    return Object.hashAll([
      l$sortType,
      _$data.containsKey('pageSize') ? l$pageSize : const {},
      _$data.containsKey('lastTokenAddress') ? l$lastTokenAddress : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$ListTokens<TRes> {
  factory CopyWith$Variables$Query$ListTokens(
    Variables$Query$ListTokens instance,
    TRes Function(Variables$Query$ListTokens) then,
  ) = _CopyWithImpl$Variables$Query$ListTokens;

  factory CopyWith$Variables$Query$ListTokens.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ListTokens;

  TRes call({
    Enum$TokenSortType? sortType,
    int? pageSize,
    String? lastTokenAddress,
  });
}

class _CopyWithImpl$Variables$Query$ListTokens<TRes>
    implements CopyWith$Variables$Query$ListTokens<TRes> {
  _CopyWithImpl$Variables$Query$ListTokens(this._instance, this._then);

  final Variables$Query$ListTokens _instance;

  final TRes Function(Variables$Query$ListTokens) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sortType = _undefined,
    Object? pageSize = _undefined,
    Object? lastTokenAddress = _undefined,
  }) => _then(
    Variables$Query$ListTokens._({
      ..._instance._$data,
      if (sortType != _undefined && sortType != null)
        'sortType': (sortType as Enum$TokenSortType),
      if (pageSize != _undefined) 'pageSize': (pageSize as int?),
      if (lastTokenAddress != _undefined)
        'lastTokenAddress': (lastTokenAddress as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$ListTokens<TRes>
    implements CopyWith$Variables$Query$ListTokens<TRes> {
  _CopyWithStubImpl$Variables$Query$ListTokens(this._res);

  TRes _res;

  call({
    Enum$TokenSortType? sortType,
    int? pageSize,
    String? lastTokenAddress,
  }) => _res;
}

class Query$ListTokens {
  Query$ListTokens({required this.tokens, this.$__typename = 'Query'});

  factory Query$ListTokens.fromJson(Map<String, dynamic> json) {
    final l$tokens = json['tokens'];
    final l$$__typename = json['__typename'];
    return Query$ListTokens(
      tokens: (l$tokens as List<dynamic>)
          .map(
            (e) =>
                Query$ListTokens$tokens.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ListTokens$tokens> tokens;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$tokens = tokens;
    _resultData['tokens'] = l$tokens.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$tokens = tokens;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$tokens.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListTokens || runtimeType != other.runtimeType) {
      return false;
    }
    final l$tokens = tokens;
    final lOther$tokens = other.tokens;
    if (l$tokens.length != lOther$tokens.length) {
      return false;
    }
    for (int i = 0; i < l$tokens.length; i++) {
      final l$tokens$entry = l$tokens[i];
      final lOther$tokens$entry = lOther$tokens[i];
      if (l$tokens$entry != lOther$tokens$entry) {
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

extension UtilityExtension$Query$ListTokens on Query$ListTokens {
  CopyWith$Query$ListTokens<Query$ListTokens> get copyWith =>
      CopyWith$Query$ListTokens(this, (i) => i);
}

abstract class CopyWith$Query$ListTokens<TRes> {
  factory CopyWith$Query$ListTokens(
    Query$ListTokens instance,
    TRes Function(Query$ListTokens) then,
  ) = _CopyWithImpl$Query$ListTokens;

  factory CopyWith$Query$ListTokens.stub(TRes res) =
      _CopyWithStubImpl$Query$ListTokens;

  TRes call({List<Query$ListTokens$tokens>? tokens, String? $__typename});
  TRes tokens(
    Iterable<Query$ListTokens$tokens> Function(
      Iterable<CopyWith$Query$ListTokens$tokens<Query$ListTokens$tokens>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$ListTokens<TRes>
    implements CopyWith$Query$ListTokens<TRes> {
  _CopyWithImpl$Query$ListTokens(this._instance, this._then);

  final Query$ListTokens _instance;

  final TRes Function(Query$ListTokens) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? tokens = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$ListTokens(
          tokens: tokens == _undefined || tokens == null
              ? _instance.tokens
              : (tokens as List<Query$ListTokens$tokens>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes tokens(
    Iterable<Query$ListTokens$tokens> Function(
      Iterable<CopyWith$Query$ListTokens$tokens<Query$ListTokens$tokens>>,
    )
    _fn,
  ) => call(
    tokens: _fn(
      _instance.tokens.map(
        (e) => CopyWith$Query$ListTokens$tokens(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$ListTokens<TRes>
    implements CopyWith$Query$ListTokens<TRes> {
  _CopyWithStubImpl$Query$ListTokens(this._res);

  TRes _res;

  call({List<Query$ListTokens$tokens>? tokens, String? $__typename}) => _res;

  tokens(_fn) => _res;
}

const documentNodeQueryListTokens = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListTokens'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'sortType')),
          type: NamedTypeNode(
            name: NameNode(value: 'TokenSortType'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'pageSize')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'lastTokenAddress')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'tokens'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'sortType'),
                value: VariableNode(name: NameNode(value: 'sortType')),
              ),
              ArgumentNode(
                name: NameNode(value: 'pageSize'),
                value: VariableNode(name: NameNode(value: 'pageSize')),
              ),
              ArgumentNode(
                name: NameNode(value: 'lastTokenAddress'),
                value: VariableNode(name: NameNode(value: 'lastTokenAddress')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'address'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'creatorAddress'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'symbol'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'logoUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'totalSupply'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'bondingCurveSupply'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'reserve'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'price'),
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
                  name: NameNode(value: 'tradesCount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'commentsCount'),
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
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$ListTokens _parserFn$Query$ListTokens(Map<String, dynamic> data) =>
    Query$ListTokens.fromJson(data);
typedef OnQueryComplete$Query$ListTokens =
    FutureOr<void> Function(Map<String, dynamic>?, Query$ListTokens?);

class Options$Query$ListTokens extends graphql.QueryOptions<Query$ListTokens> {
  Options$Query$ListTokens({
    String? operationName,
    required Variables$Query$ListTokens variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListTokens? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ListTokens? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
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
                 data == null ? null : _parserFn$Query$ListTokens(data),
               ),
         onError: onError,
         document: documentNodeQueryListTokens,
         parserFn: _parserFn$Query$ListTokens,
       );

  final OnQueryComplete$Query$ListTokens? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$ListTokens
    extends graphql.WatchQueryOptions<Query$ListTokens> {
  WatchOptions$Query$ListTokens({
    String? operationName,
    required Variables$Query$ListTokens variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListTokens? typedOptimisticResult,
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
         document: documentNodeQueryListTokens,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$ListTokens,
       );
}

class FetchMoreOptions$Query$ListTokens extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ListTokens({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ListTokens variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryListTokens,
       );
}

extension ClientExtension$Query$ListTokens on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ListTokens>> query$ListTokens(
    Options$Query$ListTokens options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$ListTokens> watchQuery$ListTokens(
    WatchOptions$Query$ListTokens options,
  ) => this.watchQuery(options);

  void writeQuery$ListTokens({
    required Query$ListTokens data,
    required Variables$Query$ListTokens variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryListTokens),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$ListTokens? readQuery$ListTokens({
    required Variables$Query$ListTokens variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryListTokens),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ListTokens.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ListTokens> useQuery$ListTokens(
  Options$Query$ListTokens options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ListTokens> useWatchQuery$ListTokens(
  WatchOptions$Query$ListTokens options,
) => graphql_flutter.useWatchQuery(options);

class Query$ListTokens$Widget extends graphql_flutter.Query<Query$ListTokens> {
  Query$ListTokens$Widget({
    widgets.Key? key,
    required Options$Query$ListTokens options,
    required graphql_flutter.QueryBuilder<Query$ListTokens> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$ListTokens$tokens {
  Query$ListTokens$tokens({
    required this.address,
    required this.creatorAddress,
    required this.name,
    required this.symbol,
    required this.logoUrl,
    required this.totalSupply,
    required this.bondingCurveSupply,
    required this.reserve,
    required this.price,
    required this.createdAt,
    required this.tradesCount,
    required this.commentsCount,
    this.$__typename = 'Token',
  });

  factory Query$ListTokens$tokens.fromJson(Map<String, dynamic> json) {
    final l$address = json['address'];
    final l$creatorAddress = json['creatorAddress'];
    final l$name = json['name'];
    final l$symbol = json['symbol'];
    final l$logoUrl = json['logoUrl'];
    final l$totalSupply = json['totalSupply'];
    final l$bondingCurveSupply = json['bondingCurveSupply'];
    final l$reserve = json['reserve'];
    final l$price = json['price'];
    final l$createdAt = json['createdAt'];
    final l$tradesCount = json['tradesCount'];
    final l$commentsCount = json['commentsCount'];
    final l$$__typename = json['__typename'];
    return Query$ListTokens$tokens(
      address: (l$address as String),
      creatorAddress: (l$creatorAddress as String),
      name: (l$name as String),
      symbol: (l$symbol as String),
      logoUrl: (l$logoUrl as String),
      totalSupply: decimalFromJson(l$totalSupply),
      bondingCurveSupply: decimalFromJson(l$bondingCurveSupply),
      reserve: decimalFromJson(l$reserve),
      price: decimalFromJson(l$price),
      createdAt: dateTimeFromJson(l$createdAt),
      tradesCount: (l$tradesCount as int),
      commentsCount: (l$commentsCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String address;

  final String creatorAddress;

  final String name;

  final String symbol;

  final String logoUrl;

  final Decimal totalSupply;

  final Decimal bondingCurveSupply;

  final Decimal reserve;

  final Decimal price;

  final DateTime createdAt;

  final int tradesCount;

  final int commentsCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address;
    final l$creatorAddress = creatorAddress;
    _resultData['creatorAddress'] = l$creatorAddress;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$symbol = symbol;
    _resultData['symbol'] = l$symbol;
    final l$logoUrl = logoUrl;
    _resultData['logoUrl'] = l$logoUrl;
    final l$totalSupply = totalSupply;
    _resultData['totalSupply'] = decimalToJson(l$totalSupply);
    final l$bondingCurveSupply = bondingCurveSupply;
    _resultData['bondingCurveSupply'] = decimalToJson(l$bondingCurveSupply);
    final l$reserve = reserve;
    _resultData['reserve'] = decimalToJson(l$reserve);
    final l$price = price;
    _resultData['price'] = decimalToJson(l$price);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$tradesCount = tradesCount;
    _resultData['tradesCount'] = l$tradesCount;
    final l$commentsCount = commentsCount;
    _resultData['commentsCount'] = l$commentsCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$creatorAddress = creatorAddress;
    final l$name = name;
    final l$symbol = symbol;
    final l$logoUrl = logoUrl;
    final l$totalSupply = totalSupply;
    final l$bondingCurveSupply = bondingCurveSupply;
    final l$reserve = reserve;
    final l$price = price;
    final l$createdAt = createdAt;
    final l$tradesCount = tradesCount;
    final l$commentsCount = commentsCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$address,
      l$creatorAddress,
      l$name,
      l$symbol,
      l$logoUrl,
      l$totalSupply,
      l$bondingCurveSupply,
      l$reserve,
      l$price,
      l$createdAt,
      l$tradesCount,
      l$commentsCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListTokens$tokens || runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$creatorAddress = creatorAddress;
    final lOther$creatorAddress = other.creatorAddress;
    if (l$creatorAddress != lOther$creatorAddress) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$symbol = symbol;
    final lOther$symbol = other.symbol;
    if (l$symbol != lOther$symbol) {
      return false;
    }
    final l$logoUrl = logoUrl;
    final lOther$logoUrl = other.logoUrl;
    if (l$logoUrl != lOther$logoUrl) {
      return false;
    }
    final l$totalSupply = totalSupply;
    final lOther$totalSupply = other.totalSupply;
    if (l$totalSupply != lOther$totalSupply) {
      return false;
    }
    final l$bondingCurveSupply = bondingCurveSupply;
    final lOther$bondingCurveSupply = other.bondingCurveSupply;
    if (l$bondingCurveSupply != lOther$bondingCurveSupply) {
      return false;
    }
    final l$reserve = reserve;
    final lOther$reserve = other.reserve;
    if (l$reserve != lOther$reserve) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$tradesCount = tradesCount;
    final lOther$tradesCount = other.tradesCount;
    if (l$tradesCount != lOther$tradesCount) {
      return false;
    }
    final l$commentsCount = commentsCount;
    final lOther$commentsCount = other.commentsCount;
    if (l$commentsCount != lOther$commentsCount) {
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

extension UtilityExtension$Query$ListTokens$tokens on Query$ListTokens$tokens {
  CopyWith$Query$ListTokens$tokens<Query$ListTokens$tokens> get copyWith =>
      CopyWith$Query$ListTokens$tokens(this, (i) => i);
}

abstract class CopyWith$Query$ListTokens$tokens<TRes> {
  factory CopyWith$Query$ListTokens$tokens(
    Query$ListTokens$tokens instance,
    TRes Function(Query$ListTokens$tokens) then,
  ) = _CopyWithImpl$Query$ListTokens$tokens;

  factory CopyWith$Query$ListTokens$tokens.stub(TRes res) =
      _CopyWithStubImpl$Query$ListTokens$tokens;

  TRes call({
    String? address,
    String? creatorAddress,
    String? name,
    String? symbol,
    String? logoUrl,
    Decimal? totalSupply,
    Decimal? bondingCurveSupply,
    Decimal? reserve,
    Decimal? price,
    DateTime? createdAt,
    int? tradesCount,
    int? commentsCount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ListTokens$tokens<TRes>
    implements CopyWith$Query$ListTokens$tokens<TRes> {
  _CopyWithImpl$Query$ListTokens$tokens(this._instance, this._then);

  final Query$ListTokens$tokens _instance;

  final TRes Function(Query$ListTokens$tokens) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? address = _undefined,
    Object? creatorAddress = _undefined,
    Object? name = _undefined,
    Object? symbol = _undefined,
    Object? logoUrl = _undefined,
    Object? totalSupply = _undefined,
    Object? bondingCurveSupply = _undefined,
    Object? reserve = _undefined,
    Object? price = _undefined,
    Object? createdAt = _undefined,
    Object? tradesCount = _undefined,
    Object? commentsCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ListTokens$tokens(
      address: address == _undefined || address == null
          ? _instance.address
          : (address as String),
      creatorAddress: creatorAddress == _undefined || creatorAddress == null
          ? _instance.creatorAddress
          : (creatorAddress as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      symbol: symbol == _undefined || symbol == null
          ? _instance.symbol
          : (symbol as String),
      logoUrl: logoUrl == _undefined || logoUrl == null
          ? _instance.logoUrl
          : (logoUrl as String),
      totalSupply: totalSupply == _undefined || totalSupply == null
          ? _instance.totalSupply
          : (totalSupply as Decimal),
      bondingCurveSupply:
          bondingCurveSupply == _undefined || bondingCurveSupply == null
          ? _instance.bondingCurveSupply
          : (bondingCurveSupply as Decimal),
      reserve: reserve == _undefined || reserve == null
          ? _instance.reserve
          : (reserve as Decimal),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as Decimal),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      tradesCount: tradesCount == _undefined || tradesCount == null
          ? _instance.tradesCount
          : (tradesCount as int),
      commentsCount: commentsCount == _undefined || commentsCount == null
          ? _instance.commentsCount
          : (commentsCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ListTokens$tokens<TRes>
    implements CopyWith$Query$ListTokens$tokens<TRes> {
  _CopyWithStubImpl$Query$ListTokens$tokens(this._res);

  TRes _res;

  call({
    String? address,
    String? creatorAddress,
    String? name,
    String? symbol,
    String? logoUrl,
    Decimal? totalSupply,
    Decimal? bondingCurveSupply,
    Decimal? reserve,
    Decimal? price,
    DateTime? createdAt,
    int? tradesCount,
    int? commentsCount,
    String? $__typename,
  }) => _res;
}

class Variables$Query$ListTopHolders {
  factory Variables$Query$ListTopHolders({required String tokenAddress}) =>
      Variables$Query$ListTopHolders._({r'tokenAddress': tokenAddress});

  Variables$Query$ListTopHolders._(this._$data);

  factory Variables$Query$ListTopHolders.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = data['tokenAddress'];
    result$data['tokenAddress'] = (l$tokenAddress as String);
    return Variables$Query$ListTopHolders._(result$data);
  }

  Map<String, dynamic> _$data;

  String get tokenAddress => (_$data['tokenAddress'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = tokenAddress;
    result$data['tokenAddress'] = l$tokenAddress;
    return result$data;
  }

  CopyWith$Variables$Query$ListTopHolders<Variables$Query$ListTopHolders>
  get copyWith => CopyWith$Variables$Query$ListTopHolders(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$ListTopHolders ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$tokenAddress = tokenAddress;
    final lOther$tokenAddress = other.tokenAddress;
    if (l$tokenAddress != lOther$tokenAddress) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$tokenAddress = tokenAddress;
    return Object.hashAll([l$tokenAddress]);
  }
}

abstract class CopyWith$Variables$Query$ListTopHolders<TRes> {
  factory CopyWith$Variables$Query$ListTopHolders(
    Variables$Query$ListTopHolders instance,
    TRes Function(Variables$Query$ListTopHolders) then,
  ) = _CopyWithImpl$Variables$Query$ListTopHolders;

  factory CopyWith$Variables$Query$ListTopHolders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ListTopHolders;

  TRes call({String? tokenAddress});
}

class _CopyWithImpl$Variables$Query$ListTopHolders<TRes>
    implements CopyWith$Variables$Query$ListTopHolders<TRes> {
  _CopyWithImpl$Variables$Query$ListTopHolders(this._instance, this._then);

  final Variables$Query$ListTopHolders _instance;

  final TRes Function(Variables$Query$ListTopHolders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? tokenAddress = _undefined}) => _then(
    Variables$Query$ListTopHolders._({
      ..._instance._$data,
      if (tokenAddress != _undefined && tokenAddress != null)
        'tokenAddress': (tokenAddress as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$ListTopHolders<TRes>
    implements CopyWith$Variables$Query$ListTopHolders<TRes> {
  _CopyWithStubImpl$Variables$Query$ListTopHolders(this._res);

  TRes _res;

  call({String? tokenAddress}) => _res;
}

class Query$ListTopHolders {
  Query$ListTopHolders({required this.topHolders, this.$__typename = 'Query'});

  factory Query$ListTopHolders.fromJson(Map<String, dynamic> json) {
    final l$topHolders = json['topHolders'];
    final l$$__typename = json['__typename'];
    return Query$ListTopHolders(
      topHolders: (l$topHolders as List<dynamic>)
          .map(
            (e) => Query$ListTopHolders$topHolders.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$ListTopHolders$topHolders> topHolders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$topHolders = topHolders;
    _resultData['topHolders'] = l$topHolders.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$topHolders = topHolders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$topHolders.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListTopHolders || runtimeType != other.runtimeType) {
      return false;
    }
    final l$topHolders = topHolders;
    final lOther$topHolders = other.topHolders;
    if (l$topHolders.length != lOther$topHolders.length) {
      return false;
    }
    for (int i = 0; i < l$topHolders.length; i++) {
      final l$topHolders$entry = l$topHolders[i];
      final lOther$topHolders$entry = lOther$topHolders[i];
      if (l$topHolders$entry != lOther$topHolders$entry) {
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

extension UtilityExtension$Query$ListTopHolders on Query$ListTopHolders {
  CopyWith$Query$ListTopHolders<Query$ListTopHolders> get copyWith =>
      CopyWith$Query$ListTopHolders(this, (i) => i);
}

abstract class CopyWith$Query$ListTopHolders<TRes> {
  factory CopyWith$Query$ListTopHolders(
    Query$ListTopHolders instance,
    TRes Function(Query$ListTopHolders) then,
  ) = _CopyWithImpl$Query$ListTopHolders;

  factory CopyWith$Query$ListTopHolders.stub(TRes res) =
      _CopyWithStubImpl$Query$ListTopHolders;

  TRes call({
    List<Query$ListTopHolders$topHolders>? topHolders,
    String? $__typename,
  });
  TRes topHolders(
    Iterable<Query$ListTopHolders$topHolders> Function(
      Iterable<
        CopyWith$Query$ListTopHolders$topHolders<
          Query$ListTopHolders$topHolders
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$ListTopHolders<TRes>
    implements CopyWith$Query$ListTopHolders<TRes> {
  _CopyWithImpl$Query$ListTopHolders(this._instance, this._then);

  final Query$ListTopHolders _instance;

  final TRes Function(Query$ListTopHolders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? topHolders = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ListTopHolders(
      topHolders: topHolders == _undefined || topHolders == null
          ? _instance.topHolders
          : (topHolders as List<Query$ListTopHolders$topHolders>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes topHolders(
    Iterable<Query$ListTopHolders$topHolders> Function(
      Iterable<
        CopyWith$Query$ListTopHolders$topHolders<
          Query$ListTopHolders$topHolders
        >
      >,
    )
    _fn,
  ) => call(
    topHolders: _fn(
      _instance.topHolders.map(
        (e) => CopyWith$Query$ListTopHolders$topHolders(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$ListTopHolders<TRes>
    implements CopyWith$Query$ListTopHolders<TRes> {
  _CopyWithStubImpl$Query$ListTopHolders(this._res);

  TRes _res;

  call({
    List<Query$ListTopHolders$topHolders>? topHolders,
    String? $__typename,
  }) => _res;

  topHolders(_fn) => _res;
}

const documentNodeQueryListTopHolders = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListTopHolders'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'tokenAddress')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'topHolders'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'tokenAddress'),
                value: VariableNode(name: NameNode(value: 'tokenAddress')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'accountAddress'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'balance'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'percentage'),
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
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Query$ListTopHolders _parserFn$Query$ListTopHolders(
  Map<String, dynamic> data,
) => Query$ListTopHolders.fromJson(data);
typedef OnQueryComplete$Query$ListTopHolders =
    FutureOr<void> Function(Map<String, dynamic>?, Query$ListTopHolders?);

class Options$Query$ListTopHolders
    extends graphql.QueryOptions<Query$ListTopHolders> {
  Options$Query$ListTopHolders({
    String? operationName,
    required Variables$Query$ListTopHolders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListTopHolders? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ListTopHolders? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
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
                 data == null ? null : _parserFn$Query$ListTopHolders(data),
               ),
         onError: onError,
         document: documentNodeQueryListTopHolders,
         parserFn: _parserFn$Query$ListTopHolders,
       );

  final OnQueryComplete$Query$ListTopHolders? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$ListTopHolders
    extends graphql.WatchQueryOptions<Query$ListTopHolders> {
  WatchOptions$Query$ListTopHolders({
    String? operationName,
    required Variables$Query$ListTopHolders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ListTopHolders? typedOptimisticResult,
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
         document: documentNodeQueryListTopHolders,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$ListTopHolders,
       );
}

class FetchMoreOptions$Query$ListTopHolders extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ListTopHolders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ListTopHolders variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryListTopHolders,
       );
}

extension ClientExtension$Query$ListTopHolders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ListTopHolders>> query$ListTopHolders(
    Options$Query$ListTopHolders options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$ListTopHolders> watchQuery$ListTopHolders(
    WatchOptions$Query$ListTopHolders options,
  ) => this.watchQuery(options);

  void writeQuery$ListTopHolders({
    required Query$ListTopHolders data,
    required Variables$Query$ListTopHolders variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryListTopHolders),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$ListTopHolders? readQuery$ListTopHolders({
    required Variables$Query$ListTopHolders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryListTopHolders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ListTopHolders.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ListTopHolders> useQuery$ListTopHolders(
  Options$Query$ListTopHolders options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ListTopHolders> useWatchQuery$ListTopHolders(
  WatchOptions$Query$ListTopHolders options,
) => graphql_flutter.useWatchQuery(options);

class Query$ListTopHolders$Widget
    extends graphql_flutter.Query<Query$ListTopHolders> {
  Query$ListTopHolders$Widget({
    widgets.Key? key,
    required Options$Query$ListTopHolders options,
    required graphql_flutter.QueryBuilder<Query$ListTopHolders> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$ListTopHolders$topHolders {
  Query$ListTopHolders$topHolders({
    required this.accountAddress,
    required this.balance,
    required this.percentage,
    this.$__typename = 'TopHolder',
  });

  factory Query$ListTopHolders$topHolders.fromJson(Map<String, dynamic> json) {
    final l$accountAddress = json['accountAddress'];
    final l$balance = json['balance'];
    final l$percentage = json['percentage'];
    final l$$__typename = json['__typename'];
    return Query$ListTopHolders$topHolders(
      accountAddress: (l$accountAddress as String),
      balance: decimalFromJson(l$balance),
      percentage: (l$percentage as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String accountAddress;

  final Decimal balance;

  final double percentage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accountAddress = accountAddress;
    _resultData['accountAddress'] = l$accountAddress;
    final l$balance = balance;
    _resultData['balance'] = decimalToJson(l$balance);
    final l$percentage = percentage;
    _resultData['percentage'] = l$percentage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accountAddress = accountAddress;
    final l$balance = balance;
    final l$percentage = percentage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accountAddress,
      l$balance,
      l$percentage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ListTopHolders$topHolders ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accountAddress = accountAddress;
    final lOther$accountAddress = other.accountAddress;
    if (l$accountAddress != lOther$accountAddress) {
      return false;
    }
    final l$balance = balance;
    final lOther$balance = other.balance;
    if (l$balance != lOther$balance) {
      return false;
    }
    final l$percentage = percentage;
    final lOther$percentage = other.percentage;
    if (l$percentage != lOther$percentage) {
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

extension UtilityExtension$Query$ListTopHolders$topHolders
    on Query$ListTopHolders$topHolders {
  CopyWith$Query$ListTopHolders$topHolders<Query$ListTopHolders$topHolders>
  get copyWith => CopyWith$Query$ListTopHolders$topHolders(this, (i) => i);
}

abstract class CopyWith$Query$ListTopHolders$topHolders<TRes> {
  factory CopyWith$Query$ListTopHolders$topHolders(
    Query$ListTopHolders$topHolders instance,
    TRes Function(Query$ListTopHolders$topHolders) then,
  ) = _CopyWithImpl$Query$ListTopHolders$topHolders;

  factory CopyWith$Query$ListTopHolders$topHolders.stub(TRes res) =
      _CopyWithStubImpl$Query$ListTopHolders$topHolders;

  TRes call({
    String? accountAddress,
    Decimal? balance,
    double? percentage,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ListTopHolders$topHolders<TRes>
    implements CopyWith$Query$ListTopHolders$topHolders<TRes> {
  _CopyWithImpl$Query$ListTopHolders$topHolders(this._instance, this._then);

  final Query$ListTopHolders$topHolders _instance;

  final TRes Function(Query$ListTopHolders$topHolders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accountAddress = _undefined,
    Object? balance = _undefined,
    Object? percentage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ListTopHolders$topHolders(
      accountAddress: accountAddress == _undefined || accountAddress == null
          ? _instance.accountAddress
          : (accountAddress as String),
      balance: balance == _undefined || balance == null
          ? _instance.balance
          : (balance as Decimal),
      percentage: percentage == _undefined || percentage == null
          ? _instance.percentage
          : (percentage as double),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$ListTopHolders$topHolders<TRes>
    implements CopyWith$Query$ListTopHolders$topHolders<TRes> {
  _CopyWithStubImpl$Query$ListTopHolders$topHolders(this._res);

  TRes _res;

  call({
    String? accountAddress,
    Decimal? balance,
    double? percentage,
    String? $__typename,
  }) => _res;
}
