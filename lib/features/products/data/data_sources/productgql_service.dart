// File: data/data_sources/product_service.dart
import 'package:altenew_assignment/core/constants/strings.dart';
import 'package:graphql/client.dart';

class ProductQLService {
  final GraphQLClient client;

  ProductQLService(this.client);

  Future<QueryResult> fetchProducts() async {
    final QueryOptions options = QueryOptions(
      document: gql(productList),
      variables: {"handle": "alcohol-markers"},
    );

    return await client.query(options);
  }
}
