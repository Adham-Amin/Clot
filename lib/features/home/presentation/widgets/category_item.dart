import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 36.r, child: Image.asset(AppAssets.imagesTestC)),
        HeightBox(12),
        Text(
          'Hoodies',
          style: AppStyles.textRegular12.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
