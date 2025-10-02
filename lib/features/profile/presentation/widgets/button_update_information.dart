import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/features/profile/data/models/requests/update_me_request.dart';
import 'package:clot/features/profile/presentation/manager/update_me_cubit/update_me_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomUpdateInformation extends StatelessWidget {
  const ButtomUpdateInformation({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
  }) : _nameController = nameController,
       _emailController = emailController,
       _phoneController = phoneController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (_nameController.text.isEmpty &&
            _emailController.text.isEmpty &&
            _phoneController.text.isEmpty) {
          customSnackBar(
            context: context,
            message: 'Please fill at least one field',
            type: AnimatedSnackBarType.error,
          );
        } else {
          final request = UpdateMeRequest();

          if (_nameController.text.isNotEmpty) {
            request.name = _nameController.text;
          }
          if (_emailController.text.isNotEmpty) {
            request.email = _emailController.text;
          }
          if (_phoneController.text.isNotEmpty) {
            request.phone = _phoneController.text;
          }
          context.read<UpdateMeCubit>().updateMe(request: request);
        }
      },
      title: 'Save',
    );
  }
}
