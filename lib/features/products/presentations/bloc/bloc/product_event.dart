part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductEvent {}

class AddToCartEvent extends ProductEvent {
  final Product product;

  AddToCartEvent(this.product);

  @override
  List<Object> get props => [product];
}
