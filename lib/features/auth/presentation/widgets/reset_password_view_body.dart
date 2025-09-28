import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

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
          Text(
            'Reset Password',
            style: AppStyles.textBold32.copyWith(color: AppColors.white),
          ),
          HeightBox(32),
          ResetPasswordForm(),
          HeightBox(32),
        ],
      ),
    );
  }
}
