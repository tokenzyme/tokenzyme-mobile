import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tokenzyme_mobile/utils/env.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';

String? getErrorCode(OperationException ex) => ex.graphqlErrors.firstOrNull?.message;

GraphQLClient getGqlClient() {
  HttpLink httpLink = HttpLink('${getCoreUrl()}/graphql');
  AuthLink authLink = AuthLink(
    getToken: () async {
      String? token = await getToken();
      return token != null ? 'Bearer $token' : null;
    },
  );

  return GraphQLClient(
    link: authLink.concat(httpLink),
    cache: GraphQLCache(),
  );
}
