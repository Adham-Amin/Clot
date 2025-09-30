import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/home/presentation/widgets/products_view_body.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductsViewBody(products: products)),
    );
  }
}
