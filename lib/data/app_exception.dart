class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() => '$_prefix$_message';
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No internet');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request time out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal server error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid url');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error occored while communicating with server ');
}
