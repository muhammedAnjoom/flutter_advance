class AppExceptions implements Exception {
  final message;
  final prefix;
  AppExceptions({
    this.message,
    this.prefix,
  });
  String toString() {
    return '$prefix$message';
  }
}

class InternetExpcetion extends AppExceptions {
  InternetExpcetion({String? message})
      : super(message: message, prefix: 'No internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut({String? message})
      : super(message: message, prefix: 'Request time out');
}

class InvaildUrl extends AppExceptions {
  InvaildUrl({String? message})
      : super(message: message, prefix: 'Invaild url');
}
