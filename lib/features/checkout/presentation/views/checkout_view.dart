import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/checkout/domain/repo/checkout_repo.dart';
import 'package:clot/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:clot/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartId});

  final String cartId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(checkoutRepo: getIt<CheckoutRepo>()),
      child: Scaffold(
        body: SafeArea(child: CheckoutViewBody(cartId: cartId)),
      ),
    );
  }
}
