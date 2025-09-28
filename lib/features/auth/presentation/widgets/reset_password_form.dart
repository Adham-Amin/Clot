import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late TextEditingController _emailController, _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          HeightBox(16),
          CustomTextFormField(
            hintText: 'New Password',
            isPassword: true,
            controller: _passwordController,
          ),
          HeightBox(32),
          BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              }
              if (state is ForgetPasswordError) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: state.message,
                  type: AnimatedSnackBarType.error,
                );
              }
              if (state is ResetPasswordSuccess) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: 'Password Reset Successfully',
                  type: AnimatedSnackBarType.success,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginView,
                  (_) => false,
                );
              }
            },
            child: CustomButton(
              title: 'Save',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<ForgetPasswordCubit>().resetPassword(
                    email: _emailController.text,
                    newPassword: _passwordController.text,
                  );
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
