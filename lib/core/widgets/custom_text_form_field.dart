import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.controller,
    this.validator,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType,
  });

  final String? Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: AppStyles.textRegular16.copyWith(color: AppColors.white),
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: widget.isPassword ? isObsecure : false,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        filled: true,
        fillColor: AppColors.secondary,
        hintText: widget.hintText,
        hintStyle: AppStyles.textRegular16.copyWith(color: AppColors.white),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => isObsecure = !isObsecure),
                icon: Icon(
                  !isObsecure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.white.withAlpha(125),
                ),
              )
            : null,
      ),
    );
  }
}
