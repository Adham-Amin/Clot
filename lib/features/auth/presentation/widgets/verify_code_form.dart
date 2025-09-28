import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:clot/features/auth/presentation/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm({super.key});

  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  late TextEditingController _codeController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _codeController,
            hintText: 'Enter Code',
            keyboardType: TextInputType.number,
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
              if (state is VerifyCodeSuccess) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: state.message.status.toString(),
                  type: AnimatedSnackBarType.success,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<ForgetPasswordCubit>(),
                      child: const ResetPasswordView(),
                    ),
                  ),
                );
              }
            },
            child: CustomButton(
              title: 'Verify',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<ForgetPasswordCubit>().verifyCode(
                    code: _codeController.text,
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
