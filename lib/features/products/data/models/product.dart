import 'package:altenew_assignment/features/products/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.status,
      required super.price,
      required super.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final variantsEdges = json['variants']['edges'] as List;
    final priceString = variantsEdges.isNotEmpty
        ? variantsEdges.first['node']['price'] as String
        : '0';

    final imagesEdges = json['images']['edges'] as List;
    final imageUrl = imagesEdges.isNotEmpty
        ? imagesEdges.first['node']['originalSrc'] as String
        : '';

    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      price: double.tryParse(priceString) ?? 0.0,
      imageUrl: imageUrl,
    );
  }

  factory ProductModel.fromEntity(ProductEntity product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      status: product.status,
      price: product.price,
      imageUrl: product.imageUrl,
    );
  }
}
