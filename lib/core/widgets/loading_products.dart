import 'package:clot/core/widgets/product_item.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingProducts extends StatelessWidget {
  const LoadingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.56,
        ),
        itemBuilder: (_, index) => ProductItem(
          product: ProductEntity(
            brand: CategoryEntity(id: '', image: '', name: ''),
            id: '',
            imageCover: '',
            title: '',
            price: 0,
            quantity: 0,
            description: '',
            images: [],
            rating: 0,
          ),
        ),
      ),
    );
  }
}
