abstract class Failure {}

class NetworkFailure extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnexpectedFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class BadRequestFailure extends Failure {}

class NotFoundFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class ForbiddenFailure extends Failure {}
