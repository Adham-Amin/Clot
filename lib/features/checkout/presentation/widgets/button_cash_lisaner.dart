import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clot/core/routes/app_routes.dart' show AppRoutes;
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/widgets/custom_button.dart' show CustomButton;
import 'package:clot/core/widgets/custom_error.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:clot/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:clot/features/checkout/data/models/request/chechout_request/shipping_address.dart';
import 'package:clot/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:clot/features/checkout/presentation/widgets/select_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCashLisaner extends StatelessWidget {
  const ButtonCashLisaner({
    super.key,
    required this.city,
    required this.details,
    required this.phone,
    required this.widget,
  });

  final String city;
  final String details;
  final String phone;
  final SelectAddress widget;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        if (state is CheckoutError) {
          Navigator.pop(context);
          CustomError(title: state.message);
        }
        if (state is CheckoutCashLoaded) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.orderDoneView,
            (_) => false,
          );
        }
      },
      child: CustomButton(
        onTap: () {
          if (city.isNotEmpty && details.isNotEmpty && phone.isNotEmpty) {
            context.read<CheckoutCubit>().cash(
              cartId: widget.cartId,
              request: CheckoutRequest(
                shippingAddress: ShippingAddress(
                  city: city,
                  details: details,
                  phone: phone,
                ),
              ),
            );
          } else {
            customSnackBar(
              context: context,
              message: 'Please Select Address',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        title: 'Cash Payment',
      ),
    );
  }
}
