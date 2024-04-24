import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/core/usecases/usecase.dart';
import 'package:altenew_assignment/features/products/data/models/product.dart';
import 'package:altenew_assignment/features/products/domain/repositories/product_repository.dart';

class GetProducts implements UseCase<DataState<List<Product>>, void> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<DataState<List<Product>>> call({void params}) async {
    return await repository.getProducts();
  }
}
