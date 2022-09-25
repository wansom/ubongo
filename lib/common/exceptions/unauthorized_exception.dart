

import 'package:ubongo/common/exceptions/server_exception.dart';

import '../constants/exception_constants.dart';

class UnauthorisedException extends ServerException {
  UnauthorisedException(String message)
      : super(
          message: message,
          code: ExceptionConstants.unauthorized,
        );
}
