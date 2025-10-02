import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/profile/data/models/requests/change_password_request.dart';
import 'package:clot/features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController _oldPasswordController,
      _newPasswordController,
      _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            HeightBox(20),
            CustomAppBar(title: 'Change Password'),
            HeightBox(32),
            CustomTextFormField(
              hintText: 'Old Password',
              controller: _oldPasswordController,
            ),
            HeightBox(16),
            CustomTextFormField(
              hintText: 'New Password',
              controller: _newPasswordController,
            ),
            HeightBox(16),
            CustomTextFormField(
              hintText: 'Confirm Password',
              controller: _confirmPasswordController,
            ),
            Expanded(child: HeightBox(16)),
            BlocListener<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                }
                if (state is ChangePasswordLoaded) {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                  customSnackBar(
                    context: context,
                    message: 'Changed Successfully',
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (state is ChangePasswordError) {
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (_newPasswordController.text ==
                        _confirmPasswordController.text) {
                      ChangePasswordRequest request = ChangePasswordRequest(
                        currentPassword: _oldPasswordController.text,
                        password: _newPasswordController.text,
                        rePassword: _confirmPasswordController.text,
                      );
                      context.read<ChangePasswordCubit>().changePassword(
                        request: request,
                      );
                    } else {
                      customSnackBar(
                        context: context,
                        message: 'Password does not match',
                        type: AnimatedSnackBarType.error,
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: 'Save',
              ),
            ),
            HeightBox(16),
          ],
        ),
      ),
    );
  }
}
