class SourceUrl {
  static const String baseUrl = String.fromEnvironment("BASE_URL");
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [RepositoryException].
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro RepositoryException}
  RepositoryException(this.error, this.stackTrace);

  /// The [Exception] which was thrown.
  final Exception error;

  /// The full [StackTrace].
  final StackTrace stackTrace;
}
