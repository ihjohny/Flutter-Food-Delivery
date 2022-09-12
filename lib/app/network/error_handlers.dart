import 'dart:io';

import 'package:flutter_food_delivery/app/network/exceptions/not_found_exception.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/app/network/exceptions/app_exception.dart';
import '/app/network/exceptions/network_exception.dart' as n;
import '/app/network/exceptions/unauthorize_exception.dart';
import '/flavors/build_config.dart';

Exception handleError(String error) {
  final logger = BuildConfig.instance.config.logger;
  logger.e("Generic exception: $error");

  return AppException(message: error);
}

Exception handleGQLException(OperationException exception) {
  return exception.linkException != null
      ? n.NetworkException(exception.linkException.toString())
      : AppException(message: exception.graphqlErrors.toString());
}

Exception handleGQLStatusCode(int statusCode, String message) {
  switch (statusCode) {
    case HttpStatus.unauthorized:
      return UnauthorizedException(message);
    case HttpStatus.notFound:
      return NotFoundException(message, "Data Not Found");
    default:
      return AppException(message: message);
  }
}
