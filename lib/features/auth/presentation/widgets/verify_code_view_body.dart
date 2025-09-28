import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/widgets/verify_code_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeViewBody extends StatelessWidget {
  const VerifyCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightBox(20),
          CustomBackIcon(),
          HeightBox(20),
          Center(child: Image.asset(AppAssets.imagesCodeToEmail, width: 100.w)),
          HeightBox(24),
          Text(
            'We Sent you an Email to reset your password.',
            textAlign: TextAlign.center,
            style: AppStyles.textMedium24.copyWith(color: AppColors.white),
          ),
          HeightBox(16),
          VerifyCodeForm(),
          HeightBox(32),
        ],
      ),
    );
  }
}
