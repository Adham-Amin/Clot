import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformationCard extends StatefulWidget {
  const PersonalInformationCard({super.key});

  @override
  State<PersonalInformationCard> createState() =>
      _PersonalInformationCardState();
}

class _PersonalInformationCardState extends State<PersonalInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          Prefs.getUser()!.name,
          style: AppStyles.textBold16.copyWith(
            color: AppColors.white,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
        subtitle: Text(
          Prefs.getUser()!.email,
          style: AppStyles.textRegular16.copyWith(
            color: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
        trailing: TextButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(
              context,
              AppRoutes.updateInfoView,
            );
            if (result == true) {
              setState(() {});
            }
          },
          child: Text(
            'Edit',
            style: AppStyles.textBold12.copyWith(
              color: AppColors.primary,
              fontFamily: GoogleFonts.gabarito().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
