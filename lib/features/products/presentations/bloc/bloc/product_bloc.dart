import 'package:altenew_assignment/core/resources/data_state.dart';
import 'package:altenew_assignment/features/products/data/models/product.dart';
import 'package:altenew_assignment/features/products/domain/usecases/get_products.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProduct;
  ProductBloc(this._getProduct) : super(ProductInitial()) {
    on<GetProductsEvent>(getProductList);
    on<AddToCartEvent>(addToCart);
  }

  void getProductList(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final dataState = await _getProduct();
    if (dataState is DataSuccess) {
      emit(ProductLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ProductError(dataState.error!));
    }
  }

  void addToCart(AddToCartEvent event, Emitter<ProductState> emit) {
    final carts = state.carts ?? [];
    carts.add(event.product);
    emit(ProductCartLoaded(carts));
  }
}
