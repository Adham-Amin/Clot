import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: AppStyles.textBold16.copyWith(
                color: AppColors.white,
                fontSize: 20.sp,
              ),
            ),
            HeightBox(4),
            Text(
              'What are you looking for?',
              style: AppStyles.textRegular12.copyWith(color: AppColors.white),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary,
          child: SvgPicture.asset(AppAssets.svgsIconCart),
        ),
      ],
    );
  }
}
