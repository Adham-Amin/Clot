import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_rich_text.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightBox(80),
          Text(
            'Sign in',
            style: AppStyles.textBold32.copyWith(color: AppColors.white),
          ),
          HeightBox(32),
          SignInForm(),
          HeightBox(32),
          Center(
            child: CustomRichText(
              text: "Don't have an account?",
              linkText: "Sign up",
              onTap: () => Navigator.pushNamed(context, AppRoutes.registerView),
            ),
          ),
          HeightBox(32),
        ],
      ),
    );
  }
}
