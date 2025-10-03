import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoAddress extends StatelessWidget {
  const NoAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Address Found',
        style: AppStyles.textBold16.copyWith(
          color: AppColors.white,
          fontFamily: GoogleFonts.gabarito().fontFamily,
        ),
      ),
    );
  }
}
