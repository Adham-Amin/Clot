import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDoneViewBody extends StatelessWidget {
  const OrderDoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            color: AppColors.primary,
            child: Image.asset(AppAssets.imagesOrderSuccess, width: 280.w),
          ),
        ),
        HeightBox(40),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                'Order Placed\nSuccessfully',
                textAlign: TextAlign.center,
                style: AppStyles.textBold32.copyWith(
                  color: AppColors.white,
                  fontFamily: GoogleFonts.gabarito().fontFamily,
                ),
              ),
              HeightBox(20),
              Text(
                'You will recieve an email\nconfirmation',
                textAlign: TextAlign.center,
                style: AppStyles.textRegular16.copyWith(
                  color: AppColors.white.withValues(alpha: 0.5),
                ),
              ),
              HeightBox(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.mainView,
                          (route) => false,
                        ),
                        title: 'Shop Now',
                      ),
                    ),
                  ],
                ),
              ),
              HeightBox(16),
            ],
          ),
        ),
      ],
    );
  }
}
