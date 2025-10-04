import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/presentation/widgets/order_details_item_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsItemsSection extends StatelessWidget {
  const OrderDetailsItemsSection({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Items',
          style: AppStyles.textBold16.copyWith(
            color: AppColors.white,
            fontFamily: GoogleFonts.gabarito().fontFamily,
          ),
        ),
        HeightBox(8),
        ...order.items.map((e) => OrderItemSection(orderItem: e)),
      ],
    );
  }
}
