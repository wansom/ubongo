
import 'package:ubongo/common/exceptions/server_exception.dart';

import '../constants/exception_constants.dart';

class BadRequestException extends ServerException {
  BadRequestException(String message)
      : super(
          message: message,
          code: ExceptionConstants.badRequest,
        );
}
