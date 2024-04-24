import 'dart:io';

import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/features/products/data/data_sources/product_service.dart';
import 'package:altenew_assignment/features/products/data/models/product.dart';
import 'package:altenew_assignment/features/products/domain/repositories/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;

  ProductRepositoryImpl({required this.productService});

  @override
  Future<DataState<List<Product>>> getProducts() async {
    try {
      final httpResponse = await productService.getProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<dynamic> productListJson = httpResponse.data['products'];
        final List<Product> productList = productListJson
            .map((productJson) =>
                Product.fromJson(productJson as Map<String, dynamic>))
            .toList();
        return DataSuccess(productList);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
