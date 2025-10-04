import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingOrderSection extends StatelessWidget {
  const ShippingOrderSection({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Shipping Address',
          style: AppStyles.textBold16.copyWith(
            color: AppColors.white,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
        HeightBox(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            'Address - ${order.address} \n Phone - ${order.phone}',
            style: AppStyles.textRegular12.copyWith(
              color: AppColors.white.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
