import 'package:altenew_assignment/core/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProductService {
  factory ProductService(Dio dio) = _ProductService;

  @GET("/products.json")
  Future<HttpResponse<dynamic>> getProducts();
}
