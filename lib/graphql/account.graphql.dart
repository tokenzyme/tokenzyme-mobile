import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$SignIn {
  factory Variables$Mutation$SignIn({required Input$SignInInput input}) =>
      Variables$Mutation$SignIn._({
        r'input': input,
      });

  Variables$Mutation$SignIn._(this._$data);

  factory Variables$Mutation$SignIn.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$SignInInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$SignIn._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SignInInput get input => (_$data['input'] as Input$SignInInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$SignIn<Variables$Mutation$SignIn> get copyWith =>
      CopyWith$Variables$Mutation$SignIn(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SignIn ||
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

abstract class CopyWith$Variables$Mutation$SignIn<TRes> {
  factory CopyWith$Variables$Mutation$SignIn(
    Variables$Mutation$SignIn instance,
    TRes Function(Variables$Mutation$SignIn) then,
  ) = _CopyWithImpl$Variables$Mutation$SignIn;

  factory CopyWith$Variables$Mutation$SignIn.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SignIn;

  TRes call({Input$SignInInput? input});
}

class _CopyWithImpl$Variables$Mutation$SignIn<TRes>
    implements CopyWith$Variables$Mutation$SignIn<TRes> {
  _CopyWithImpl$Variables$Mutation$SignIn(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SignIn _instance;

  final TRes Function(Variables$Mutation$SignIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(Variables$Mutation$SignIn._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$SignInInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SignIn<TRes>
    implements CopyWith$Variables$Mutation$SignIn<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SignIn(this._res);

  TRes _res;

  call({Input$SignInInput? input}) => _res;
}

class Mutation$SignIn {
  Mutation$SignIn({
    required this.signIn,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SignIn.fromJson(Map<String, dynamic> json) {
    final l$signIn = json['signIn'];
    final l$$__typename = json['__typename'];
    return Mutation$SignIn(
      signIn:
          Mutation$SignIn$signIn.fromJson((l$signIn as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SignIn$signIn signIn;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signIn = signIn;
    _resultData['signIn'] = l$signIn.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signIn = signIn;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signIn,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SignIn || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signIn = signIn;
    final lOther$signIn = other.signIn;
    if (l$signIn != lOther$signIn) {
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

extension UtilityExtension$Mutation$SignIn on Mutation$SignIn {
  CopyWith$Mutation$SignIn<Mutation$SignIn> get copyWith =>
      CopyWith$Mutation$SignIn(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignIn<TRes> {
  factory CopyWith$Mutation$SignIn(
    Mutation$SignIn instance,
    TRes Function(Mutation$SignIn) then,
  ) = _CopyWithImpl$Mutation$SignIn;

  factory CopyWith$Mutation$SignIn.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignIn;

  TRes call({
    Mutation$SignIn$signIn? signIn,
    String? $__typename,
  });
  CopyWith$Mutation$SignIn$signIn<TRes> get signIn;
}

class _CopyWithImpl$Mutation$SignIn<TRes>
    implements CopyWith$Mutation$SignIn<TRes> {
  _CopyWithImpl$Mutation$SignIn(
    this._instance,
    this._then,
  );

  final Mutation$SignIn _instance;

  final TRes Function(Mutation$SignIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signIn = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignIn(
        signIn: signIn == _undefined || signIn == null
            ? _instance.signIn
            : (signIn as Mutation$SignIn$signIn),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SignIn$signIn<TRes> get signIn {
    final local$signIn = _instance.signIn;
    return CopyWith$Mutation$SignIn$signIn(
        local$signIn, (e) => call(signIn: e));
  }
}

class _CopyWithStubImpl$Mutation$SignIn<TRes>
    implements CopyWith$Mutation$SignIn<TRes> {
  _CopyWithStubImpl$Mutation$SignIn(this._res);

  TRes _res;

  call({
    Mutation$SignIn$signIn? signIn,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SignIn$signIn<TRes> get signIn =>
      CopyWith$Mutation$SignIn$signIn.stub(_res);
}

const documentNodeMutationSignIn = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SignIn'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SignInInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signIn'),
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
            name: NameNode(value: 'token'),
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
Mutation$SignIn _parserFn$Mutation$SignIn(Map<String, dynamic> data) =>
    Mutation$SignIn.fromJson(data);
typedef OnMutationCompleted$Mutation$SignIn = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SignIn?,
);

class Options$Mutation$SignIn extends graphql.MutationOptions<Mutation$SignIn> {
  Options$Mutation$SignIn({
    String? operationName,
    required Variables$Mutation$SignIn variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignIn? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SignIn? onCompleted,
    graphql.OnMutationUpdate<Mutation$SignIn>? update,
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
                    data == null ? null : _parserFn$Mutation$SignIn(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSignIn,
          parserFn: _parserFn$Mutation$SignIn,
        );

  final OnMutationCompleted$Mutation$SignIn? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SignIn
    extends graphql.WatchQueryOptions<Mutation$SignIn> {
  WatchOptions$Mutation$SignIn({
    String? operationName,
    required Variables$Mutation$SignIn variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignIn? typedOptimisticResult,
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
          document: documentNodeMutationSignIn,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SignIn,
        );
}

extension ClientExtension$Mutation$SignIn on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SignIn>> mutate$SignIn(
          Options$Mutation$SignIn options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SignIn> watchMutation$SignIn(
          WatchOptions$Mutation$SignIn options) =>
      this.watchMutation(options);
}

class Mutation$SignIn$HookResult {
  Mutation$SignIn$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SignIn runMutation;

  final graphql.QueryResult<Mutation$SignIn> result;
}

Mutation$SignIn$HookResult useMutation$SignIn(
    [WidgetOptions$Mutation$SignIn? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$SignIn());
  return Mutation$SignIn$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SignIn> useWatchMutation$SignIn(
        WatchOptions$Mutation$SignIn options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SignIn
    extends graphql.MutationOptions<Mutation$SignIn> {
  WidgetOptions$Mutation$SignIn({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignIn? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SignIn? onCompleted,
    graphql.OnMutationUpdate<Mutation$SignIn>? update,
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
                    data == null ? null : _parserFn$Mutation$SignIn(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSignIn,
          parserFn: _parserFn$Mutation$SignIn,
        );

  final OnMutationCompleted$Mutation$SignIn? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SignIn = graphql.MultiSourceResult<Mutation$SignIn>
    Function(
  Variables$Mutation$SignIn, {
  Object? optimisticResult,
  Mutation$SignIn? typedOptimisticResult,
});
typedef Builder$Mutation$SignIn = widgets.Widget Function(
  RunMutation$Mutation$SignIn,
  graphql.QueryResult<Mutation$SignIn>?,
);

class Mutation$SignIn$Widget extends graphql_flutter.Mutation<Mutation$SignIn> {
  Mutation$SignIn$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SignIn? options,
    required Builder$Mutation$SignIn builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SignIn(),
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

class Mutation$SignIn$signIn {
  Mutation$SignIn$signIn({
    required this.token,
    this.$__typename = 'SignInResult',
  });

  factory Mutation$SignIn$signIn.fromJson(Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Mutation$SignIn$signIn(
      token: (l$token as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SignIn$signIn || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$SignIn$signIn on Mutation$SignIn$signIn {
  CopyWith$Mutation$SignIn$signIn<Mutation$SignIn$signIn> get copyWith =>
      CopyWith$Mutation$SignIn$signIn(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignIn$signIn<TRes> {
  factory CopyWith$Mutation$SignIn$signIn(
    Mutation$SignIn$signIn instance,
    TRes Function(Mutation$SignIn$signIn) then,
  ) = _CopyWithImpl$Mutation$SignIn$signIn;

  factory CopyWith$Mutation$SignIn$signIn.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignIn$signIn;

  TRes call({
    String? token,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SignIn$signIn<TRes>
    implements CopyWith$Mutation$SignIn$signIn<TRes> {
  _CopyWithImpl$Mutation$SignIn$signIn(
    this._instance,
    this._then,
  );

  final Mutation$SignIn$signIn _instance;

  final TRes Function(Mutation$SignIn$signIn) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignIn$signIn(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SignIn$signIn<TRes>
    implements CopyWith$Mutation$SignIn$signIn<TRes> {
  _CopyWithStubImpl$Mutation$SignIn$signIn(this._res);

  TRes _res;

  call({
    String? token,
    String? $__typename,
  }) =>
      _res;
}
