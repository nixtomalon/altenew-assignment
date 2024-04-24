import 'package:altenew_assignment/features/products/domain/entities/product.dart';
import 'package:altenew_assignment/features/products/presentations/bloc/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int cartCount = 0;

  @override
  void initState() {
    final cart = BlocProvider.of<ProductBloc>(context).state.carts;
    if (cart != null) {
      cartCount = cart.length;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Altenew Assignment'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(Icons.shopping_cart_outlined),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoaded || state is ProductCartLoaded) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              padding: const EdgeInsets.all(16),
              children:
                  state.products!.map((p) => ProductItem(product: p)).toList(),
            );
          }
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductError) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return SizedBox();
        }),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/details',
        arguments: product,
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.height / 8.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
