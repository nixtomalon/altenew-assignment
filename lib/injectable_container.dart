import 'package:altenew_assignment/config/graphql_config.dart';
import 'package:altenew_assignment/features/products/data/data_sources/productgql_service.dart';
import 'package:altenew_assignment/features/products/data/repositories/product_repository_impl.dart';
import 'package:altenew_assignment/features/products/domain/repositories/product_repository.dart';
import 'package:altenew_assignment/features/products/domain/usecases/get_products.dart';
import 'package:altenew_assignment/features/products/presentations/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<GraphQLClient>(GraphQLconfig().clientToQuery());

  sl.registerSingleton<ProductQLService>(ProductQLService(sl()));

  sl.registerSingleton<ProductRepository>(
      ProductRepositoryImpl(productService: sl()));

  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));

  sl.registerSingleton(GetProducts(sl()));
}
