import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/product_details/presentation/widgets/botton_product_details.dart';
import 'package:clot/features/product_details/presentation/widgets/brand_section.dart';
import 'package:clot/features/product_details/presentation/widgets/descrption_section.dart';
import 'package:clot/features/product_details/presentation/widgets/header_product_details.dart';
import 'package:clot/features/product_details/presentation/widgets/icon_back_and_fav.dart';
import 'package:clot/features/product_details/presentation/widgets/reviews_section.dart';
import 'package:clot/features/product_details/presentation/widgets/select_color_product.dart';
import 'package:clot/features/product_details/presentation/widgets/select_sized_product.dart';
import 'package:clot/features/product_details/presentation/widgets/shipping_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightBox(20),
            IconBackAndFav(product: product),
            HeightBox(24),
            HeaderProductDetails(product: product),
            HeightBox(24),
            SelectSizeProduct(),
            HeightBox(12),
            SelectColorProduct(),
            HeightBox(24),
            DescriptionSection(product: product),
            HeightBox(24),
            BrandSection(product: product),
            HeightBox(24),
            ShippingSection(product: product),
            HeightBox(24),
            ReviewsSection(product: product),
            HeightBox(24),
            ButtonProductDetails(product: product),
            HeightBox(16),
          ],
        ),
      ),
    );
  }
}
