import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key, required this.totalPrice});

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Total',
            style: AppStyles.textRegular16.copyWith(
              color: AppColors.white.withValues(alpha: 0.5),
            ),
          ),
        ),
        Text(
          '\$${totalPrice.toStringAsFixed(2)}',
          style: AppStyles.textBold16.copyWith(
            color: AppColors.white,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
      ],
    );
  }
}
