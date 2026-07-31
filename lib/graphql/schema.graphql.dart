class Input$SignInInput {
  factory Input$SignInInput({
    required String signatureMessageId,
    required String signature,
  }) =>
      Input$SignInInput._({
        r'signatureMessageId': signatureMessageId,
        r'signature': signature,
      });

  Input$SignInInput._(this._$data);

  factory Input$SignInInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$signatureMessageId = data['signatureMessageId'];
    result$data['signatureMessageId'] = (l$signatureMessageId as String);
    final l$signature = data['signature'];
    result$data['signature'] = (l$signature as String);
    return Input$SignInInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get signatureMessageId => (_$data['signatureMessageId'] as String);

  String get signature => (_$data['signature'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$signatureMessageId = signatureMessageId;
    result$data['signatureMessageId'] = l$signatureMessageId;
    final l$signature = signature;
    result$data['signature'] = l$signature;
    return result$data;
  }

  CopyWith$Input$SignInInput<Input$SignInInput> get copyWith =>
      CopyWith$Input$SignInInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SignInInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signatureMessageId = signatureMessageId;
    final lOther$signatureMessageId = other.signatureMessageId;
    if (l$signatureMessageId != lOther$signatureMessageId) {
      return false;
    }
    final l$signature = signature;
    final lOther$signature = other.signature;
    if (l$signature != lOther$signature) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$signatureMessageId = signatureMessageId;
    final l$signature = signature;
    return Object.hashAll([
      l$signatureMessageId,
      l$signature,
    ]);
  }
}

abstract class CopyWith$Input$SignInInput<TRes> {
  factory CopyWith$Input$SignInInput(
    Input$SignInInput instance,
    TRes Function(Input$SignInInput) then,
  ) = _CopyWithImpl$Input$SignInInput;

  factory CopyWith$Input$SignInInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SignInInput;

  TRes call({
    String? signatureMessageId,
    String? signature,
  });
}

class _CopyWithImpl$Input$SignInInput<TRes>
    implements CopyWith$Input$SignInInput<TRes> {
  _CopyWithImpl$Input$SignInInput(
    this._instance,
    this._then,
  );

  final Input$SignInInput _instance;

  final TRes Function(Input$SignInInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signatureMessageId = _undefined,
    Object? signature = _undefined,
  }) =>
      _then(Input$SignInInput._({
        ..._instance._$data,
        if (signatureMessageId != _undefined && signatureMessageId != null)
          'signatureMessageId': (signatureMessageId as String),
        if (signature != _undefined && signature != null)
          'signature': (signature as String),
      }));
}

class _CopyWithStubImpl$Input$SignInInput<TRes>
    implements CopyWith$Input$SignInInput<TRes> {
  _CopyWithStubImpl$Input$SignInInput(this._res);

  TRes _res;

  call({
    String? signatureMessageId,
    String? signature,
  }) =>
      _res;
}

class Input$CreateSignatureMessageInput {
  factory Input$CreateSignatureMessageInput({
    required String accountAddress,
    required Enum$SignatureMessageType type,
  }) =>
      Input$CreateSignatureMessageInput._({
        r'accountAddress': accountAddress,
        r'type': type,
      });

  Input$CreateSignatureMessageInput._(this._$data);

  factory Input$CreateSignatureMessageInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$accountAddress = data['accountAddress'];
    result$data['accountAddress'] = (l$accountAddress as String);
    final l$type = data['type'];
    result$data['type'] =
        fromJson$Enum$SignatureMessageType((l$type as String));
    return Input$CreateSignatureMessageInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get accountAddress => (_$data['accountAddress'] as String);

  Enum$SignatureMessageType get type =>
      (_$data['type'] as Enum$SignatureMessageType);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$accountAddress = accountAddress;
    result$data['accountAddress'] = l$accountAddress;
    final l$type = type;
    result$data['type'] = toJson$Enum$SignatureMessageType(l$type);
    return result$data;
  }

  CopyWith$Input$CreateSignatureMessageInput<Input$CreateSignatureMessageInput>
      get copyWith => CopyWith$Input$CreateSignatureMessageInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateSignatureMessageInput ||
        runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$accountAddress = accountAddress;
    final l$type = type;
    return Object.hashAll([
      l$accountAddress,
      l$type,
    ]);
  }
}

abstract class CopyWith$Input$CreateSignatureMessageInput<TRes> {
  factory CopyWith$Input$CreateSignatureMessageInput(
    Input$CreateSignatureMessageInput instance,
    TRes Function(Input$CreateSignatureMessageInput) then,
  ) = _CopyWithImpl$Input$CreateSignatureMessageInput;

  factory CopyWith$Input$CreateSignatureMessageInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateSignatureMessageInput;

  TRes call({
    String? accountAddress,
    Enum$SignatureMessageType? type,
  });
}

class _CopyWithImpl$Input$CreateSignatureMessageInput<TRes>
    implements CopyWith$Input$CreateSignatureMessageInput<TRes> {
  _CopyWithImpl$Input$CreateSignatureMessageInput(
    this._instance,
    this._then,
  );

  final Input$CreateSignatureMessageInput _instance;

  final TRes Function(Input$CreateSignatureMessageInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accountAddress = _undefined,
    Object? type = _undefined,
  }) =>
      _then(Input$CreateSignatureMessageInput._({
        ..._instance._$data,
        if (accountAddress != _undefined && accountAddress != null)
          'accountAddress': (accountAddress as String),
        if (type != _undefined && type != null)
          'type': (type as Enum$SignatureMessageType),
      }));
}

class _CopyWithStubImpl$Input$CreateSignatureMessageInput<TRes>
    implements CopyWith$Input$CreateSignatureMessageInput<TRes> {
  _CopyWithStubImpl$Input$CreateSignatureMessageInput(this._res);

  TRes _res;

  call({
    String? accountAddress,
    Enum$SignatureMessageType? type,
  }) =>
      _res;
}

class Input$AddCommentInput {
  factory Input$AddCommentInput({
    required String tokenAddress,
    required String text,
  }) =>
      Input$AddCommentInput._({
        r'tokenAddress': tokenAddress,
        r'text': text,
      });

  Input$AddCommentInput._(this._$data);

  factory Input$AddCommentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = data['tokenAddress'];
    result$data['tokenAddress'] = (l$tokenAddress as String);
    final l$text = data['text'];
    result$data['text'] = (l$text as String);
    return Input$AddCommentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get tokenAddress => (_$data['tokenAddress'] as String);

  String get text => (_$data['text'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$tokenAddress = tokenAddress;
    result$data['tokenAddress'] = l$tokenAddress;
    final l$text = text;
    result$data['text'] = l$text;
    return result$data;
  }

  CopyWith$Input$AddCommentInput<Input$AddCommentInput> get copyWith =>
      CopyWith$Input$AddCommentInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AddCommentInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$tokenAddress = tokenAddress;
    final lOther$tokenAddress = other.tokenAddress;
    if (l$tokenAddress != lOther$tokenAddress) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$tokenAddress = tokenAddress;
    final l$text = text;
    return Object.hashAll([
      l$tokenAddress,
      l$text,
    ]);
  }
}

abstract class CopyWith$Input$AddCommentInput<TRes> {
  factory CopyWith$Input$AddCommentInput(
    Input$AddCommentInput instance,
    TRes Function(Input$AddCommentInput) then,
  ) = _CopyWithImpl$Input$AddCommentInput;

  factory CopyWith$Input$AddCommentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AddCommentInput;

  TRes call({
    String? tokenAddress,
    String? text,
  });
}

class _CopyWithImpl$Input$AddCommentInput<TRes>
    implements CopyWith$Input$AddCommentInput<TRes> {
  _CopyWithImpl$Input$AddCommentInput(
    this._instance,
    this._then,
  );

  final Input$AddCommentInput _instance;

  final TRes Function(Input$AddCommentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tokenAddress = _undefined,
    Object? text = _undefined,
  }) =>
      _then(Input$AddCommentInput._({
        ..._instance._$data,
        if (tokenAddress != _undefined && tokenAddress != null)
          'tokenAddress': (tokenAddress as String),
        if (text != _undefined && text != null) 'text': (text as String),
      }));
}

class _CopyWithStubImpl$Input$AddCommentInput<TRes>
    implements CopyWith$Input$AddCommentInput<TRes> {
  _CopyWithStubImpl$Input$AddCommentInput(this._res);

  TRes _res;

  call({
    String? tokenAddress,
    String? text,
  }) =>
      _res;
}

enum Enum$TradeType {
  BUY,
  SELL,
  $unknown;

  factory Enum$TradeType.fromJson(String value) =>
      fromJson$Enum$TradeType(value);

  String toJson() => toJson$Enum$TradeType(this);
}

String toJson$Enum$TradeType(Enum$TradeType e) {
  switch (e) {
    case Enum$TradeType.BUY:
      return r'BUY';
    case Enum$TradeType.SELL:
      return r'SELL';
    case Enum$TradeType.$unknown:
      return r'$unknown';
  }
}

Enum$TradeType fromJson$Enum$TradeType(String value) {
  switch (value) {
    case r'BUY':
      return Enum$TradeType.BUY;
    case r'SELL':
      return Enum$TradeType.SELL;
    default:
      return Enum$TradeType.$unknown;
  }
}

enum Enum$TokenSortType {
  NEW,
  PROGRESS,
  PROMOTED,
  $unknown;

  factory Enum$TokenSortType.fromJson(String value) =>
      fromJson$Enum$TokenSortType(value);

  String toJson() => toJson$Enum$TokenSortType(this);
}

String toJson$Enum$TokenSortType(Enum$TokenSortType e) {
  switch (e) {
    case Enum$TokenSortType.NEW:
      return r'NEW';
    case Enum$TokenSortType.PROGRESS:
      return r'PROGRESS';
    case Enum$TokenSortType.PROMOTED:
      return r'PROMOTED';
    case Enum$TokenSortType.$unknown:
      return r'$unknown';
  }
}

Enum$TokenSortType fromJson$Enum$TokenSortType(String value) {
  switch (value) {
    case r'NEW':
      return Enum$TokenSortType.NEW;
    case r'PROGRESS':
      return Enum$TokenSortType.PROGRESS;
    case r'PROMOTED':
      return Enum$TokenSortType.PROMOTED;
    default:
      return Enum$TokenSortType.$unknown;
  }
}

enum Enum$SignatureMessageType {
  SIGN_IN,
  $unknown;

  factory Enum$SignatureMessageType.fromJson(String value) =>
      fromJson$Enum$SignatureMessageType(value);

  String toJson() => toJson$Enum$SignatureMessageType(this);
}

String toJson$Enum$SignatureMessageType(Enum$SignatureMessageType e) {
  switch (e) {
    case Enum$SignatureMessageType.SIGN_IN:
      return r'SIGN_IN';
    case Enum$SignatureMessageType.$unknown:
      return r'$unknown';
  }
}

Enum$SignatureMessageType fromJson$Enum$SignatureMessageType(String value) {
  switch (value) {
    case r'SIGN_IN':
      return Enum$SignatureMessageType.SIGN_IN;
    default:
      return Enum$SignatureMessageType.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
