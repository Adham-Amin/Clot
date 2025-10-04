import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/custom_error.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot/features/cart/presentation/widgets/cart_item.dart';
import 'package:clot/features/cart/presentation/widgets/custom_loading_cart.dart';
import 'package:clot/features/cart/presentation/widgets/no_cart.dart';
import 'package:clot/features/cart/presentation/widgets/total_price_section.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(20),
          CustomAppBar(title: 'Cart'),
          HeightBox(32),
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  if (state.cartEntity.products.isEmpty) {
                    return const NoCart();
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.cartEntity.products.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CartItem(
                            product: state.cartEntity.products[index],
                          ),
                        ),
                      ),
                      TotalPriceSection(
                        totalPrice: state.cartEntity.totalPrice,
                      ),
                      HeightBox(16),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.checkoutView,
                                  arguments: state.cartEntity.cartId,
                                );
                              },
                              title: 'Checkout',
                            ),
                          ),
                        ],
                      ),
                      HeightBox(16),
                    ],
                  );
                } else if (state is CartError) {
                  return CustomError(title: state.message);
                } else if (state is CartLoading) {
                  return CustomLoadingCart();
                } else {
                  return const NoCart();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
