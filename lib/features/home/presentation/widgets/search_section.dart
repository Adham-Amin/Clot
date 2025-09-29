import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColors.secondary,
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.svgsIconSerch),
            WidthBox(12),
            Text(
              'Search',
              style: AppStyles.textRegular12.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
