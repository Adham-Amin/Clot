import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonProductDetails extends StatelessWidget {
  const ButtonProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product.price}',
              style: AppStyles.textBold16.copyWith(
                color: AppColors.white,
                fontFamily: GoogleFonts.gabarito().fontFamily,
              ),
            ),
            Text(
              'Add to Bag',
              style: AppStyles.textRegular16.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
