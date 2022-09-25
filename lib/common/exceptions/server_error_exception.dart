

import 'package:ubongo/common/exceptions/server_exception.dart';

import '../constants/exception_constants.dart';

class ServerErrorException extends ServerException {
  ServerErrorException(String message)
      : super(
          message: message,
          code: ExceptionConstants.internalServerError,
        );
}
