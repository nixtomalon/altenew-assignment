import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> fetchProducts();
}
