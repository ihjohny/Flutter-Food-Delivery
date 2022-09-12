import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:get/get.dart';
import '../../flavors/build_config.dart';
import '../data/local/preference/preference_manager.dart';

class GraphQLClientProvider {
  static GraphQLClient? _instance;

  static final HttpLink httpLink =
      HttpLink(BuildConfig.instance.config.baseUrl);

  static final AuthLink authLink = AuthLink(
      headerKey: "authorization",
      getToken: () async {
        final token = await Get.find(tag: (PreferenceManager).toString())
            .getString(PreferenceManager.keyToken);

        return "Bearer $token";
      });

  static final Link link = authLink.concat(httpLink);

  static GraphQLClient get client {
    return _instance ??= GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }
}
