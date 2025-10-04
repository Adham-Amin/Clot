import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late TextEditingController _emailController, _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
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
            controller: _emailController,
          ),
          HeightBox(16),
          CustomTextFormField(
            hintText: 'Password',
            controller: _passwordController,
            isPassword: true,
          ),
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.forgetPasswordView),
              child: Text(
                'Forgot password?',
                style: AppStyles.textRegular12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          HeightBox(16),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              }
              if (state is AuthSuccess) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.mainView);
              }
              if (state is AuthError) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: state.message,
                  type: AnimatedSnackBarType.error,
                );
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Sign in',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        BlocProvider.of<AuthCubit>(context).login(
                          email: _emailController.text,
                          password: _passwordController.text,
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
          ),
        ],
      ),
    );
  }
}
