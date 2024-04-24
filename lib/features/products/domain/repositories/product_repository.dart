import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/features/products/data/models/product.dart';

abstract class ProductRepository {
  Future<DataState<List<Product>>> getProducts();
}
