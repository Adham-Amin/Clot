import 'package:clot/core/di/service_locator.dart';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/features/orders/domain/repo/orders_repo.dart';
import 'package:clot/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:clot/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrdersCubit(ordersRepo: getIt<OrdersRepo>())
            ..getOrders(userId: Prefs.getCartId()!),
      child: const Scaffold(body: SafeArea(child: OrdersViewBody())),
    );
  }
}
