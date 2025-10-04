import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/orders/domain/entities/orders_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItemSection extends StatelessWidget {
  const OrderItemSection({super.key, required this.orderItem});

  final OrdersItemEntity orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64.w,
            height: 64.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: orderItem.image,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          WidthBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        orderItem.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textRegular12.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Text(
                      '\$${orderItem.price.toStringAsFixed(2)}',
                      style: AppStyles.textBold12.copyWith(
                        color: AppColors.white,
                        fontFamily: GoogleFonts.gabarito().fontFamily,
                      ),
                    ),
                  ],
                ),
                HeightBox(8),
                Row(
                  children: [
                    Text(
                      'Quantity - ',
                      style: AppStyles.textRegular12.copyWith(
                        color: AppColors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      '${orderItem.count}',
                      style: AppStyles.textBold12.copyWith(
                        color: AppColors.white,
                        fontFamily: GoogleFonts.gabarito().fontFamily,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
