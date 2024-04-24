class Product {
  final String id;
  final String title;
  final String description;
  final String status;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Extracting price from nested structures
    final variantsEdges = json['variants']['edges'] as List;
    final priceString = variantsEdges.isNotEmpty
        ? variantsEdges.first['node']['price'] as String
        : '0';

    // Extracting image URL from nested structures
    final imagesEdges = json['images']['edges'] as List;
    final imageUrl = imagesEdges.isNotEmpty
        ? imagesEdges.first['node']['originalSrc'] as String
        : '';

    // Parse the price and return the product instance
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      price: double.tryParse(priceString) ?? 0.0,
      imageUrl: imageUrl,
    );
  }
}
