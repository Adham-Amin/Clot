import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoCart extends StatelessWidget {
  const NoCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.imagesNoCart, width: 100.w),
        HeightBox(24),
        Text(
          'Your Cart is Empty',
          style: AppStyles.textBold16.copyWith(color: AppColors.white),
        ),
        HeightBox(8),
        CustomButton(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Explore Categories',
        ),
      ],
    );
  }
}
