import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/category_card.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key, required this.categories});
  final List<CategoryEntity> categories;

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
            'Shop by Categories',
            style: AppStyles.textBold24.copyWith(
              fontFamily: GoogleFonts.gabarito().fontFamily,
              color: AppColors.white,
            ),
          ),
          HeightBox(24),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (context, index) => HeightBox(8),
              itemBuilder: (context, index) => CategoryCard(
                category: categories[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productsCategoriesView,
                    arguments: categories[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
