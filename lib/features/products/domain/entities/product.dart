import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String status;
  final double price;
  final String imageUrl;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, description, status, price, imageUrl];
}
