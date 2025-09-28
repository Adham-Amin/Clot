import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary,
        ),
        child: SvgPicture.asset(AppAssets.svgsArrowBack),
      ),
    );
  }
}
