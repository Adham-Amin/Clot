import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.orderDetailsView,
        arguments: order,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            AppAssets.imagesIconOrders,
            width: 40.w,
            height: 40.h,
          ),
          title: Text(
            'Order #${order.id}',
            style: AppStyles.textMedium16.copyWith(color: AppColors.white),
          ),
          subtitle: Text(
            '${order.items.length} items',
            style: AppStyles.textRegular12.copyWith(
              color: AppColors.white.withValues(alpha: 0.5),
            ),
          ),
          trailing: SvgPicture.asset(AppAssets.svgsArrowRight),
        ),
      ),
    );
  }
}
