

import 'package:ubongo/common/exceptions/server_exception.dart';

import '../constants/exception_constants.dart';

class ForbiddenException extends ServerException {
  ForbiddenException(String message)
      : super(
          message: message,
          code: ExceptionConstants.forbidden,
        );
}
