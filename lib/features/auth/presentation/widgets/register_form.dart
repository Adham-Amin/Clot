import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: 'Name', keyboardType: TextInputType.name),
        HeightBox(16),
        CustomTextFormField(
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
        ),
        HeightBox(16),
        CustomTextFormField(
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
        ),
        HeightBox(16),
        CustomTextFormField(
          hintText: 'Phone',
          keyboardType: TextInputType.visiblePassword,
        ),
        HeightBox(16),
        CustomButton(title: 'Sign up', onTap: () {}),
      ],
    );
  }
}
