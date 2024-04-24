part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<Product>? products;
  final DioException? error;
  final List<Product>? carts;

  const ProductState({this.products, this.error, this.carts});

  @override
  List<Object> get props => [products!, error!, carts!];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  const ProductLoaded(List<Product> products) : super(products: products);
}

class ProductCartLoaded extends ProductState {
  const ProductCartLoaded(List<Product> carts) : super(carts: carts);
}

class ProductError extends ProductState {
  const ProductError(DioException error) : super(error: error);
}
