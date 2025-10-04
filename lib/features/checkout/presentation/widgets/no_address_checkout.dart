import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class NoAddressCheckout extends StatelessWidget {
  const NoAddressCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'No Address Found',
          style: AppStyles.textBold16.copyWith(color: AppColors.white),
        ),
        HeightBox(12),
        CustomButton(
          onTap: () => Navigator.pushNamed(context, AppRoutes.addAddressView),
          title: 'Add Address',
        ),
      ],
    );
  }
}
