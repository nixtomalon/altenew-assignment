part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<ProductEntity>? products;
  final Exception? error;
  final List<ProductEntity>? carts;

  const ProductState({this.products, this.error, this.carts});

  @override
  List<Object> get props => [products!, error!, carts!];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  const ProductLoaded(List<ProductEntity> products) : super(products: products);
}

class ProductCartLoaded extends ProductState {
  const ProductCartLoaded(
      List<ProductEntity> carts, List<ProductEntity> products)
      : super(carts: carts, products: products);
}

class ProductError extends ProductState {
  const ProductError(Exception error) : super(error: error);
}
