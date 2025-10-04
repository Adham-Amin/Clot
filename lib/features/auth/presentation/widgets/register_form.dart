import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/data/models/requests/register_request.dart';
import 'package:clot/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _nameController,
      _emailController,
      _passwordController,
      _phoneController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
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
            hintText: 'Name',
            keyboardType: TextInputType.name,
            controller: _nameController,
          ),
          HeightBox(16),
          CustomTextFormField(
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          HeightBox(16),
          CustomTextFormField(
            hintText: 'Password',
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          HeightBox(16),
          CustomTextFormField(
            hintText: 'Phone',
            controller: _phoneController,
            keyboardType: TextInputType.visiblePassword,
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
                    title: 'Sign up',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthCubit>().register(
                          registerRequest: RegisterRequest(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            phone: _phoneController.text,
                            rePassword: _passwordController.text,
                          ),
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
