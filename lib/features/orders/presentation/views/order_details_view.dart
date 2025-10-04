import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/presentation/widgets/order_details_view_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrderDetailsViewBody(order: order)),
    );
  }
}
