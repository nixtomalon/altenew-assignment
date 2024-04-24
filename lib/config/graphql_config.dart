import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLconfig {
  static HttpLink httpLink = HttpLink(
      'https://testaltenew.myshopify.com/admin/api/2024-04/graphql.json',
      defaultHeaders: {'X-Shopify-Access-Token': 'YOUR_ACCESS_TOKEN'});

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}
