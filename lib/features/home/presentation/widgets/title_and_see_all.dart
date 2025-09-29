import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSeeAll extends StatelessWidget {
  const TitleAndSeeAll({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.textBold16.copyWith(
            fontFamily: GoogleFonts.gabarito().fontFamily,
            color: AppColors.white,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: AppStyles.textRegular16.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
