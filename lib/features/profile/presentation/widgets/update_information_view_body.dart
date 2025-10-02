import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/profile/presentation/manager/update_me_cubit/update_me_cubit.dart';
import 'package:clot/features/profile/presentation/widgets/button_update_information.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateInformationViewBody extends StatefulWidget {
  const UpdateInformationViewBody({super.key});

  @override
  State<UpdateInformationViewBody> createState() =>
      _UpdateInformationViewBodyState();
}

class _UpdateInformationViewBodyState extends State<UpdateInformationViewBody> {
  late TextEditingController _nameController,
      _emailController,
      _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateMeCubit, UpdateMeState>(
      listener: (context, state) {
        if (state is UpdateMeLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        if (state is UpdateMeLoaded) {
          Navigator.pop(context);
          Navigator.pop(context, true);
          customSnackBar(
            context: context,
            message: 'Updated Successfully',
            type: AnimatedSnackBarType.success,
          );
        }
        if (state is UpdateMeError) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            HeightBox(20),
            CustomAppBar(title: 'Update Information'),
            HeightBox(32),
            CustomTextFormField(hintText: 'Name', controller: _nameController),
            HeightBox(16),
            CustomTextFormField(
              hintText: 'Email',
              controller: _emailController,
            ),
            HeightBox(16),
            CustomTextFormField(
              hintText: 'Phone',
              controller: _phoneController,
            ),
            Expanded(child: HeightBox(32)),
            ButtomUpdateInformation(
              nameController: _nameController,
              emailController: _emailController,
              phoneController: _phoneController,
            ),
            HeightBox(16),
          ],
        ),
      ),
    );
  }
}
