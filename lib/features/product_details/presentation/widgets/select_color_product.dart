import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectColorProduct extends StatefulWidget {
  const SelectColorProduct({super.key});

  @override
  State<SelectColorProduct> createState() => _SelectColorProductState();
}

class _SelectColorProductState extends State<SelectColorProduct> {
  Map<String, dynamic> selectedColor = {
    'name': 'Orange',
    'color': Colors.orange,
  };

  final List<Map<String, dynamic>> colors = [
    {'name': 'Orange', 'color': Colors.orange},
    {'name': 'Black', 'color': Colors.black},
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Blue', 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.dark,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Color",
                    style: AppStyles.textBold24.copyWith(
                      color: AppColors.white,
                      fontFamily: GoogleFonts.gabarito().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ...colors.map((item) {
                    final isSelected = item['name'] == selectedColor['name'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = item;
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
                          children: [
                            Text(
                              item['name'] as String,
                              style: AppStyles.textMedium16.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: item['color'] as Color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                            WidthBox(24),
                            isSelected
                                ? Icon(Icons.check, color: AppColors.white)
                                : Container(width: 24),
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
              "Color",
              style: AppStyles.textRegular16.copyWith(color: AppColors.white),
            ),
            Spacer(),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: selectedColor['color'] as Color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
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
