import 'package:altenew_assignment/features/products/domain/entities/product.dart';
import 'package:altenew_assignment/features/products/presentations/screens/details_screen.dart';
import 'package:altenew_assignment/features/products/presentations/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ProductListScreen());
      case '/details':
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
                  product: settings.arguments as ProductEntity,
                ));
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
