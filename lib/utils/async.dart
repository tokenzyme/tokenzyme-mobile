Future<T?> waitFor<T>(
  int maxRetries,
  Duration retryInterval,
  Future<T?> Function() func,
) async {
  for (int i = 0; i < maxRetries; i++) {
    T? result = await func();
    if (result != null) {
      return result;
    }
    await Future<void>.delayed(retryInterval);
  }
  return null;
}
