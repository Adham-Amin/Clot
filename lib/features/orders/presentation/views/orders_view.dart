import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:clot/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    final cartId = Prefs.getCartId();
    if (cartId != null) {
      context.read<OrdersCubit>().getOrders(userId: cartId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OrdersViewBody()));
  }
}
