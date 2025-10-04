import 'package:clot/core/widgets/custom_error.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/checkout/presentation/widgets/loading_address.dart';
import 'package:clot/features/checkout/presentation/widgets/no_address_checkout.dart';
import 'package:clot/features/checkout/presentation/widgets/select_address.dart';
import 'package:clot/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.cartId});

  final String cartId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(20),
          CustomAppBar(title: 'Checkout'),
          HeightBox(32),
          Expanded(
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state is AddressLoaded) {
                  if (state.addresses.isEmpty) {
                    return Expanded(child: const NoAddressCheckout());
                  }
                  return SelectAddress(
                    cartId: cartId,
                    addresses: state.addresses,
                  );
                } else if (state is AddressError) {
                  return CustomError(title: state.message);
                } else if (state is AddressLoading) {
                  return LoadingAddresses();
                } else {
                  return NoAddressCheckout();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
