import 'package:dr_scan_graduation_project/core/data/errors/exceptions.dart';
import 'package:dr_scan_graduation_project/core/data/errors/failure.dart';
import 'package:dr_scan_graduation_project/core/resources/messages.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void handleError(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        Get.snackbar('error', NETWORK_ERROR);
        break;
      case ServerFailure:
        Get.snackbar('error', SERVER_ERROR);
        break;
      case UnauthorizedFailure:
        Get.snackbar('error', UNAUTHORIZED_ERROR);
        break;
      case NotFoundFailure:
        Get.snackbar('error', NOT_FOUND_ERROR);
        break;
      case ForbiddenFailure:
        Get.snackbar('error', FORBIDDEN_ERROR);
        break;
      case BadRequestFailure:
        Get.snackbar('error', INVALID_RESPONSE_FORMAT);
        break;
      default:
        Get.snackbar('error', UNEXPECTED_ERROR);
    }
  }

  static Failure handleException(Exception exception) {
    switch (exception.runtimeType) {
      case NetworkException:
        return NetworkFailure();
      case ServerException:
        return ServerFailure();
      case UnauthorizedException:
        return UnauthorizedFailure();
      case NotFoundException:
        return NotFoundFailure();
      case ForbiddenException:
        return ForbiddenFailure();
      case BadRequestException:
        return BadRequestFailure();
      default:
        return UnexpectedFailure();
    }
  }
}
