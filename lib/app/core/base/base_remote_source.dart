import 'dart:io';

import 'package:flutter_food_delivery/app/network/error_handlers.dart';
import 'package:flutter_food_delivery/app/network/exceptions/app_exception.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/flavors/build_config.dart';
import '../../network/graphql_client_provider.dart';

abstract class BaseRemoteSource {
  GraphQLClient get gqlClient => GraphQLClientProvider.client;

  final logger = BuildConfig.instance.config.logger;

  Future<QueryResult<T>> apiCall<T>(Future<QueryResult<T>> api) async {
    try {
      QueryResult<T> result = await api;
      if (result.hasException) {
        throw handleGQLException(result.exception!);
      } else if (result.data!["statusCode"] != HttpStatus.ok) {
        throw handleGQLStatusCode(
            result.data!["statusCode"], result.data!["message"]);
      } else {
        return result;
      }
    } catch (error) {
      if (error is AppException) {
        rethrow;
      } else {
        throw handleError(error.toString());
      }
    }
  }
}
