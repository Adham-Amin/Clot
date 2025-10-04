import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddOrDelButton extends StatelessWidget {
  const AddOrDelButton({super.key, required this.onTap, required this.isAdd});

  final VoidCallback onTap;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          isAdd ? AppAssets.svgsAdd : AppAssets.svgsMinus,
        ),
      ),
    );
  }
}
