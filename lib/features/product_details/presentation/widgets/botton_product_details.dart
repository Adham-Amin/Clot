import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/product_details/presentation/widgets/button_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonProductDetails extends StatelessWidget {
  const ButtonProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.primary,
      ),
      child: ButtonBuilder(product: product),
    );
  }
}
