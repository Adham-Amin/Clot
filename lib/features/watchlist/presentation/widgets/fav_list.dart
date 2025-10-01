import 'package:clot/core/widgets/product_item.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavList extends StatelessWidget {
  const FavList({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 24.w),
      itemCount: products.length,
      physics: BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.56,
      ),
      itemBuilder: (_, index) => ProductItem(product: products[index]),
    );
  }
}
