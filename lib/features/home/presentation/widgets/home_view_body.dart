import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/presentation/widgets/brands_section.dart';
import 'package:clot/features/home/presentation/widgets/categories_section.dart';
import 'package:clot/features/home/presentation/widgets/home_header.dart';
import 'package:clot/features/home/presentation/widgets/search_section.dart';
import 'package:clot/features/home/presentation/widgets/top_selling_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeightBox(20),
            HomeHeader(),
            HeightBox(24),
            SearchSection(),
            HeightBox(24),
            CategoriesSection(),
            HeightBox(24),
            BrandsSection(),
            HeightBox(24),
            TopSellingSection(),
            HeightBox(16),
          ],
        ),
      ),
    );
  }
}
