import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/core/usecases/usecase.dart';
import 'package:altenew_assignment/features/products/domain/entities/product.dart';
import 'package:altenew_assignment/features/products/domain/repositories/product_repository.dart';

class GetProducts implements UseCase<DataState<List<ProductEntity>>, void> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) async {
    return await repository.fetchProducts();
  }
}
