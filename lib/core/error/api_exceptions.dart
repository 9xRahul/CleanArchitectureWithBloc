abstract class AppException implements Exception {
  final String message;
  final int statusCode;

  const AppException(this.message, this.statusCode);

  @override
  String toString() => message;
}

// Network / API error
class ServerException extends AppException {
  ServerException([
    super.message = 'Server error occurred',
    super.statusCode = 500,
  ]);
}

// Invalid credentials
class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException([
    super.message = 'Invalid credentials',
    super.statusCode = 400,
  ]);
}

// No internet
class NetworkException extends AppException {
  NetworkException([
    super.message = 'No internet connection',
    super.statusCode = 00,
  ]);
}

// Unknown error
class UnknownException extends AppException {
  const UnknownException([
    super.message = 'Unknown error occurred',
    super.statusCode = 11,
  ]);
}
