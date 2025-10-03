import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/core/widgets/custom_text_form_field.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/profile/data/models/requests/address_request.dart';
import 'package:clot/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key});

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController cityController,
      stateController,
      addressController,
      phoneController;

  @override
  void initState() {
    cityController = TextEditingController();
    stateController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cityController.dispose();
    stateController.dispose();
    addressController.dispose();
    phoneController.dispose();
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
            CustomAppBar(title: 'Add Address'),
            HeightBox(32),
            CustomTextFormField(
              hintText: 'Street Address',
              controller: addressController,
            ),
            HeightBox(16),
            CustomTextFormField(hintText: 'State', controller: stateController),
            HeightBox(16),
            CustomTextFormField(hintText: 'City', controller: cityController),
            HeightBox(16),
            CustomTextFormField(
              controller: phoneController,
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
            Expanded(child: HeightBox(16)),
            BlocListener<AddressCubit, AddressState>(
              listener: (context, state) {
                if (state is AddressLoading) {
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
                if (state is AddressLoaded) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: 'Address Added Successfully',
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (state is AddressError) {
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
                    context.read<AddressCubit>().addAddress(
                      request: AddressRequest(
                        name: stateController.text,
                        details: addressController.text,
                        phone: phoneController.text,
                        city: cityController.text,
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
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
