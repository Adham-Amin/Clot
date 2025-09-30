import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/core/widgets/loading_products.dart';
import 'package:clot/core/widgets/product_item.dart';
import 'package:clot/features/categories/presentation/managers/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsCategoryViewBody extends StatelessWidget {
  const ProductsCategoryViewBody({super.key, required this.category});

  final String category;

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
            category,
            style: AppStyles.textBold16.copyWith(
              fontFamily: GoogleFonts.gabarito().fontFamily,
              color: AppColors.white,
            ),
          ),
          HeightBox(24),
          BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
            builder: (context, state) {
              if (state is ProductsByCategoryLoaded) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: state.products.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.56,
                        ),
                    itemBuilder: (_, index) =>
                        ProductItem(product: state.products[index]),
                  ),
                );
              } else if (state is ProductsByCategoryError) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppStyles.textBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                );
              } else {
                return const Expanded(child: LoadingProducts());
              }
            },
          ),
        ],
      ),
    );
  }
}
