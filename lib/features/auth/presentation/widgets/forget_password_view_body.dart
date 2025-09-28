import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

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
            'Forgot Password',
            style: AppStyles.textBold32.copyWith(color: AppColors.white),
          ),
          HeightBox(16),
          Text(
            'Enter your email address and we will send you a link to reset your password. ',
            textAlign: TextAlign.center,
            style: AppStyles.textRegular16.copyWith(color: AppColors.white),
          ),
          HeightBox(32),
          CustomTextFormField(hintText: 'Email Address'),
          HeightBox(32),
          CustomButton(
            title: 'Send',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.verifyCodeView);
            },
          ),
          HeightBox(32),
        ],
      ),
    );
  }
}
