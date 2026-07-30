extension ExceptionExtensions on Exception {
  String get message => toString().replaceFirst(RegExp(r'\w*Exception:'), '').trim();
}
