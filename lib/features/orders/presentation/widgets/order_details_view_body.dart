import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/presentation/widgets/order_details_items_section.dart';
import 'package:clot/features/orders/presentation/widgets/shipping_order_section.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(20),
          CustomAppBar(title: 'Order #${order.id}'),
          HeightBox(32),
          ShippingOrderSection(order: order),
          HeightBox(32),
          OrderDetailsItemsSection(order: order),
        ],
      ),
    );
  }
}
