import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$CreateSignatureMessage {
  factory Variables$Mutation$CreateSignatureMessage({
    required Input$CreateSignatureMessageInput input,
  }) => Variables$Mutation$CreateSignatureMessage._({r'input': input});

  Variables$Mutation$CreateSignatureMessage._(this._$data);

  factory Variables$Mutation$CreateSignatureMessage.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateSignatureMessageInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateSignatureMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateSignatureMessageInput get input =>
      (_$data['input'] as Input$CreateSignatureMessageInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateSignatureMessage<
    Variables$Mutation$CreateSignatureMessage
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CreateSignatureMessage(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateSignatureMessage ||
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

abstract class CopyWith$Variables$Mutation$CreateSignatureMessage<TRes> {
  factory CopyWith$Variables$Mutation$CreateSignatureMessage(
    Variables$Mutation$CreateSignatureMessage instance,
    TRes Function(Variables$Mutation$CreateSignatureMessage) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateSignatureMessage;

  factory CopyWith$Variables$Mutation$CreateSignatureMessage.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateSignatureMessage;

  TRes call({Input$CreateSignatureMessageInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateSignatureMessage<TRes>
    implements CopyWith$Variables$Mutation$CreateSignatureMessage<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateSignatureMessage(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateSignatureMessage _instance;

  final TRes Function(Variables$Mutation$CreateSignatureMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateSignatureMessage._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateSignatureMessageInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateSignatureMessage<TRes>
    implements CopyWith$Variables$Mutation$CreateSignatureMessage<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateSignatureMessage(this._res);

  TRes _res;

  call({Input$CreateSignatureMessageInput? input}) => _res;
}

class Mutation$CreateSignatureMessage {
  Mutation$CreateSignatureMessage({
    required this.createSignatureMessage,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateSignatureMessage.fromJson(Map<String, dynamic> json) {
    final l$createSignatureMessage = json['createSignatureMessage'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateSignatureMessage(
      createSignatureMessage:
          Mutation$CreateSignatureMessage$createSignatureMessage.fromJson(
            (l$createSignatureMessage as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateSignatureMessage$createSignatureMessage
  createSignatureMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createSignatureMessage = createSignatureMessage;
    _resultData['createSignatureMessage'] = l$createSignatureMessage.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createSignatureMessage = createSignatureMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createSignatureMessage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateSignatureMessage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createSignatureMessage = createSignatureMessage;
    final lOther$createSignatureMessage = other.createSignatureMessage;
    if (l$createSignatureMessage != lOther$createSignatureMessage) {
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

extension UtilityExtension$Mutation$CreateSignatureMessage
    on Mutation$CreateSignatureMessage {
  CopyWith$Mutation$CreateSignatureMessage<Mutation$CreateSignatureMessage>
  get copyWith => CopyWith$Mutation$CreateSignatureMessage(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateSignatureMessage<TRes> {
  factory CopyWith$Mutation$CreateSignatureMessage(
    Mutation$CreateSignatureMessage instance,
    TRes Function(Mutation$CreateSignatureMessage) then,
  ) = _CopyWithImpl$Mutation$CreateSignatureMessage;

  factory CopyWith$Mutation$CreateSignatureMessage.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateSignatureMessage;

  TRes call({
    Mutation$CreateSignatureMessage$createSignatureMessage?
    createSignatureMessage,
    String? $__typename,
  });
  CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<TRes>
  get createSignatureMessage;
}

class _CopyWithImpl$Mutation$CreateSignatureMessage<TRes>
    implements CopyWith$Mutation$CreateSignatureMessage<TRes> {
  _CopyWithImpl$Mutation$CreateSignatureMessage(this._instance, this._then);

  final Mutation$CreateSignatureMessage _instance;

  final TRes Function(Mutation$CreateSignatureMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createSignatureMessage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateSignatureMessage(
      createSignatureMessage:
          createSignatureMessage == _undefined || createSignatureMessage == null
          ? _instance.createSignatureMessage
          : (createSignatureMessage
                as Mutation$CreateSignatureMessage$createSignatureMessage),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<TRes>
  get createSignatureMessage {
    final local$createSignatureMessage = _instance.createSignatureMessage;
    return CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage(
      local$createSignatureMessage,
      (e) => call(createSignatureMessage: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateSignatureMessage<TRes>
    implements CopyWith$Mutation$CreateSignatureMessage<TRes> {
  _CopyWithStubImpl$Mutation$CreateSignatureMessage(this._res);

  TRes _res;

  call({
    Mutation$CreateSignatureMessage$createSignatureMessage?
    createSignatureMessage,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<TRes>
  get createSignatureMessage =>
      CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage.stub(
        _res,
      );
}

const documentNodeMutationCreateSignatureMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateSignatureMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateSignatureMessageInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createSignatureMessage'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'message'),
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
Mutation$CreateSignatureMessage _parserFn$Mutation$CreateSignatureMessage(
  Map<String, dynamic> data,
) => Mutation$CreateSignatureMessage.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateSignatureMessage =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CreateSignatureMessage?,
    );

class Options$Mutation$CreateSignatureMessage
    extends graphql.MutationOptions<Mutation$CreateSignatureMessage> {
  Options$Mutation$CreateSignatureMessage({
    String? operationName,
    required Variables$Mutation$CreateSignatureMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateSignatureMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateSignatureMessage? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateSignatureMessage>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$CreateSignatureMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateSignatureMessage,
         parserFn: _parserFn$Mutation$CreateSignatureMessage,
       );

  final OnMutationCompleted$Mutation$CreateSignatureMessage?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateSignatureMessage
    extends graphql.WatchQueryOptions<Mutation$CreateSignatureMessage> {
  WatchOptions$Mutation$CreateSignatureMessage({
    String? operationName,
    required Variables$Mutation$CreateSignatureMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateSignatureMessage? typedOptimisticResult,
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
         document: documentNodeMutationCreateSignatureMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateSignatureMessage,
       );
}

extension ClientExtension$Mutation$CreateSignatureMessage
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateSignatureMessage>>
  mutate$CreateSignatureMessage(
    Options$Mutation$CreateSignatureMessage options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateSignatureMessage>
  watchMutation$CreateSignatureMessage(
    WatchOptions$Mutation$CreateSignatureMessage options,
  ) => this.watchMutation(options);
}

class Mutation$CreateSignatureMessage$HookResult {
  Mutation$CreateSignatureMessage$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateSignatureMessage runMutation;

  final graphql.QueryResult<Mutation$CreateSignatureMessage> result;
}

Mutation$CreateSignatureMessage$HookResult useMutation$CreateSignatureMessage([
  WidgetOptions$Mutation$CreateSignatureMessage? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateSignatureMessage(),
  );
  return Mutation$CreateSignatureMessage$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateSignatureMessage>
useWatchMutation$CreateSignatureMessage(
  WatchOptions$Mutation$CreateSignatureMessage options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateSignatureMessage
    extends graphql.MutationOptions<Mutation$CreateSignatureMessage> {
  WidgetOptions$Mutation$CreateSignatureMessage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateSignatureMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateSignatureMessage? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateSignatureMessage>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$CreateSignatureMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateSignatureMessage,
         parserFn: _parserFn$Mutation$CreateSignatureMessage,
       );

  final OnMutationCompleted$Mutation$CreateSignatureMessage?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateSignatureMessage =
    graphql.MultiSourceResult<Mutation$CreateSignatureMessage> Function(
      Variables$Mutation$CreateSignatureMessage, {
      Object? optimisticResult,
      Mutation$CreateSignatureMessage? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateSignatureMessage =
    widgets.Widget Function(
      RunMutation$Mutation$CreateSignatureMessage,
      graphql.QueryResult<Mutation$CreateSignatureMessage>?,
    );

class Mutation$CreateSignatureMessage$Widget
    extends graphql_flutter.Mutation<Mutation$CreateSignatureMessage> {
  Mutation$CreateSignatureMessage$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateSignatureMessage? options,
    required Builder$Mutation$CreateSignatureMessage builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateSignatureMessage(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$CreateSignatureMessage$createSignatureMessage {
  Mutation$CreateSignatureMessage$createSignatureMessage({
    required this.id,
    required this.message,
    this.$__typename = 'SignatureMessage',
  });

  factory Mutation$CreateSignatureMessage$createSignatureMessage.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateSignatureMessage$createSignatureMessage(
      id: (l$id as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$message, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateSignatureMessage$createSignatureMessage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$CreateSignatureMessage$createSignatureMessage
    on Mutation$CreateSignatureMessage$createSignatureMessage {
  CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<
    Mutation$CreateSignatureMessage$createSignatureMessage
  >
  get copyWith =>
      CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<
  TRes
> {
  factory CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage(
    Mutation$CreateSignatureMessage$createSignatureMessage instance,
    TRes Function(Mutation$CreateSignatureMessage$createSignatureMessage) then,
  ) = _CopyWithImpl$Mutation$CreateSignatureMessage$createSignatureMessage;

  factory CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateSignatureMessage$createSignatureMessage;

  TRes call({String? id, String? message, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateSignatureMessage$createSignatureMessage<TRes>
    implements
        CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<TRes> {
  _CopyWithImpl$Mutation$CreateSignatureMessage$createSignatureMessage(
    this._instance,
    this._then,
  );

  final Mutation$CreateSignatureMessage$createSignatureMessage _instance;

  final TRes Function(Mutation$CreateSignatureMessage$createSignatureMessage)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateSignatureMessage$createSignatureMessage(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      message: message == _undefined || message == null
          ? _instance.message
          : (message as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateSignatureMessage$createSignatureMessage<
  TRes
>
    implements
        CopyWith$Mutation$CreateSignatureMessage$createSignatureMessage<TRes> {
  _CopyWithStubImpl$Mutation$CreateSignatureMessage$createSignatureMessage(
    this._res,
  );

  TRes _res;

  call({String? id, String? message, String? $__typename}) => _res;
}
