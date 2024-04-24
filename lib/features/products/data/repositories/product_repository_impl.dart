import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/features/products/data/data_sources/productgql_service.dart';
import 'package:altenew_assignment/features/products/data/models/product.dart';
import 'package:altenew_assignment/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductQLService productService;

  ProductRepositoryImpl({required this.productService});

  @override
  Future<DataState<List<ProductModel>>> fetchProducts() async {
    try {
      final result = await productService.fetchProducts();

      if (result.hasException) {
        return DataFailed(result.exception!);
      }

      List? datas = result.data?['collectionByHandle']?['products']?['edges'];

      List<ProductModel> products = [];

      if (datas == null || datas.isEmpty) {
        return DataSuccess(products);
      }

      products = datas.map((e) => ProductModel.fromJson(e['node'])).toList();

      return DataSuccess(products);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}
