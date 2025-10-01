import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/product_details/presentation/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewBody(product: product)),
    );
  }
}
