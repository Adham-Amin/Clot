import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/product_details/presentation/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderProductDetails extends StatelessWidget {
  const HeaderProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageSlider(images: product.images),
        HeightBox(24),
        Text(
          product.title,
          style: AppStyles.textBold16.copyWith(
            color: AppColors.white,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
        HeightBox(16),
        Text(
          '\$${product.price}',
          style: AppStyles.textBold16.copyWith(
            color: AppColors.primary,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
      ],
    );
  }
}
