import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/custom_rich_text.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
            'Create Account',
            style: AppStyles.textBold32.copyWith(color: AppColors.white),
          ),
          HeightBox(32),
          RegisterForm(),
          HeightBox(32),
          Center(
            child: CustomRichText(
              text: "Already have an account?",
              linkText: "Sign in",
              onTap: () => Navigator.pop(context),
            ),
          ),
          HeightBox(32),
        ],
      ),
    );
  }
}
