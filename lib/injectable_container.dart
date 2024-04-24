import 'package:altenew_assignment/features/products/data/data_sources/product_service.dart';
import 'package:altenew_assignment/features/products/data/repositories/product_repository_impl.dart';
import 'package:altenew_assignment/features/products/domain/repositories/product_repository.dart';
import 'package:altenew_assignment/features/products/domain/usecases/get_products.dart';
import 'package:altenew_assignment/features/products/presentations/bloc/bloc/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<ProductService>(ProductService(sl()));

  sl.registerSingleton<ProductRepository>(
      ProductRepositoryImpl(productService: sl()));

  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));

  sl.registerSingleton(GetProducts(sl()));
}
