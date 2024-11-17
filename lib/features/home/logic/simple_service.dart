import 'package:dartz/dartz.dart';
import 'package:simple_app/core/network/utils/failures.dart';
import 'package:simple_app/core/service_locators/simple_locator.dart';

abstract class SimpleService {
  Future<Either<Failure, String>> getGoogleResponse();
}

class SimpleServiceImplimentation extends SimpleService {
  @override
  Future<Either<Failure, String>> getGoogleResponse() {
    return simpleApi.getGoogleResponse();
  }
}
