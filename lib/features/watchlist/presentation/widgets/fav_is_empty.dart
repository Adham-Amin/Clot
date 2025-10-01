import 'package:clot/core/functions/navigate_to_tab.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class FavIsEmpty extends StatelessWidget {
  const FavIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Favourites is\n Empty',
          textAlign: TextAlign.center,
          style: AppStyles.textMedium24.copyWith(color: AppColors.white),
        ),
        HeightBox(12),
        CustomButton(
          onTap: () {
            navigateToTab(context, 0);
          },
          title: 'Explore Categories',
        ),
      ],
    );
  }
}
