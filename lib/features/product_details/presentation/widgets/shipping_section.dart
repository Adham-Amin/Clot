import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping & Returns',
          style: AppStyles.textBold16.copyWith(
            fontFamily: GoogleFonts.gabarito().fontFamily,
            color: AppColors.white,
          ),
        ),
        HeightBox(12),
        Text(
          'Free standard shipping and free 60-day returns.',
          style: AppStyles.textRegular12.copyWith(
            color: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
