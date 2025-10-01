import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/category_card.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brand',
          style: AppStyles.textBold16.copyWith(
            color: AppColors.white,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
        HeightBox(12),
        CategoryCard(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.productsBrandsView,
              arguments: product.brand,
            );
          },
          category: product.brand,
        ),
      ],
    );
  }
}
