import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSizeProduct extends StatefulWidget {
  const SelectSizeProduct({super.key});

  @override
  State<SelectSizeProduct> createState() => _SelectSizeProductState();
}

class _SelectSizeProductState extends State<SelectSizeProduct> {
  String selectedSize = "S";
  final List<String> sizes = ["S", "M", "L", "XL"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select Size",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...sizes.map((size) {
                    final isSelected = size == selectedSize;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.secondary,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              size,
                              style: AppStyles.textMedium16.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            Text(
              "Size",
              style: AppStyles.textRegular16.copyWith(color: AppColors.white),
            ),
            Spacer(),
            Text(
              selectedSize,
              style: AppStyles.textBold16.copyWith(
                color: AppColors.white,
                fontFamily: GoogleFonts.gabarito().fontFamily,
              ),
            ),
            WidthBox(24),
            SvgPicture.asset(AppAssets.svgsArrowDown),
          ],
        ),
      ),
    );
  }
}
