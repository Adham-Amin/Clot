import 'package:clot/core/functions/navigate_to_tab.dart';
import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/profile/presentation/widgets/personal_information_card.dart';
import 'package:clot/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(20),
          Center(
            child: Text(
              'Profile',
              style: AppStyles.textBold16.copyWith(
                color: AppColors.white,
                fontFamily: GoogleFonts.gabarito().fontFamily,
              ),
            ),
          ),
          const Expanded(child: HeightBox(20)),
          Image.asset(
            AppAssets.imagesAvatar,
            width: 80.w,
            height: 80.w,
            fit: BoxFit.fill,
          ),
          HeightBox(32),
          PersonalInformationCard(),
          HeightBox(24),
          ProfileItem(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.changePasswordView);
            },
            title: 'Change Password',
          ),
          ProfileItem(onTap: () {}, title: 'Addresses'),
          ProfileItem(
            onTap: () {
              navigateToTab(context, 2);
            },
            title: 'Favorites',
          ),
          ProfileItem(title: 'Help & Support'),
          HeightBox(68),
          TextButton(
            onPressed: () {
              Prefs.clearUserData();
              Prefs.clearToken();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginView,
                (_) => false,
              );
            },
            child: Text(
              'Sign Out',
              style: AppStyles.textBold16.copyWith(
                color: AppColors.red,
                fontFamily: GoogleFonts.gabarito().fontFamily,
              ),
            ),
          ),
          HeightBox(16),
        ],
      ),
    );
  }
}
