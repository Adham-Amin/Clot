import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/profile/data/models/responses/address_response.dart';
import 'package:clot/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.address, this.isOrder});

  final AddressResponse address;
  final bool? isOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${address.details}, ${address.name}, ${address.city}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textBold16.copyWith(color: AppColors.white),
            ),
          ),
          WidthBox(8.w),
          isOrder == true
              ? SvgPicture.asset(AppAssets.svgsArrowRight)
              : GestureDetector(
                  onTap: () {
                    context.read<AddressCubit>().deleteAddress(
                      id: address.id ?? '',
                    );
                  },
                  child: Text(
                    'Delete',
                    style: AppStyles.textRegular16.copyWith(
                      color: AppColors.primary,
                      fontFamily: GoogleFonts.gabarito().fontFamily,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
