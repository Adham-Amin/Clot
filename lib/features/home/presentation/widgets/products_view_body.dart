import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/core/widgets/product_item.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightBox(20),
          CustomBackIcon(),
          HeightBox(16),
          Text(
            'Top Selling (${products.length})',
            style: AppStyles.textBold16.copyWith(
              fontFamily: GoogleFonts.gabarito().fontFamily,
              color: AppColors.white,
            ),
          ),
          HeightBox(24),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.56,
              ),
              itemBuilder: (_, index) => ProductItem(product: products[index]),
            ),
          ),
        ],
      ),
    );
  }
}
