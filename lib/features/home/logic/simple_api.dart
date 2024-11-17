import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:simple_app/core/network/rest/api_endpoints.dart';
import 'package:simple_app/core/network/utils/utils.dart';
import 'package:simple_app/core/service_locators/app_locator.dart';

abstract class SimpleApi {
  Future<Either<Failure, String>> getGoogleResponse();
}

class SimpleApiImplimentation implements SimpleApi {
  @override
  Future<Either<Failure, String>> getGoogleResponse() async {
    try {
      final result = await apiClient.get(
        simpleEndpoints.simpleUrl,
      );
      return Right(result.data);
    } catch (e) {
      log(e.toString());
      return left(ApiFailure(message: e.toString()));
    }
  }
}
