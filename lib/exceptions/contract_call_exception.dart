class ContractCallException implements Exception {
  final int code;
  final String message;

  ContractCallException(this.code, this.message);

  @override
  String toString() => 'ContractCallException: $code - $message';
}
