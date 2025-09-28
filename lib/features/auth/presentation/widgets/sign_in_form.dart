import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: 'Email Address'),
        HeightBox(16),
        CustomTextFormField(hintText: 'Password', isPassword: true),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password?',
              style: AppStyles.textRegular12.copyWith(color: AppColors.primary),
            ),
          ),
        ),
        HeightBox(16),
        CustomButton(title: 'Sign in', onTap: () {}),
      ],
    );
  }
}
