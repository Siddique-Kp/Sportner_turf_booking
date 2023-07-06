class AppExceptions implements Exception {
  final dynamic _message;
  

  AppExceptions([this._message]);

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message);
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message]) : super(message);
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message);
}

class InvalidException extends AppExceptions {
  InvalidException([String? message]) : super(message);
}
