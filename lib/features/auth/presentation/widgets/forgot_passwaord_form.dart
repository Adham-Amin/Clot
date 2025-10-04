import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:clot/features/auth/presentation/views/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late TextEditingController _emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
            keyboardType: TextInputType.emailAddress,
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
              if (state is ForgetPasswordSuccess) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: state.message.message.toString(),
                  type: AnimatedSnackBarType.success,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<ForgetPasswordCubit>(),
                      child: const VerifyCodeView(),
                    ),
                  ),
                );
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Send',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<ForgetPasswordCubit>().forgetPassword(
                          email: _emailController.text,
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
