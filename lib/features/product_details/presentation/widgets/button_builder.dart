import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isInCart =
            state is CartLoaded &&
            state.cartEntity.products.any(
              (productCart) => productCart.id == product.id,
            );
        return state is CartLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 22.w,
                    height: 22.h,
                    child: CircularProgressIndicator(color: AppColors.white),
                  ),
                ],
              )
            : isInCart
            ? GestureDetector(
                onTap: () {
                  context.read<CartCubit>().removeFromCart(
                    productId: product.id,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Delete from Bag',
                      style: AppStyles.textBold16.copyWith(
                        color: AppColors.white,
                        fontFamily: GoogleFonts.gabarito().fontFamily,
                      ),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  context.read<CartCubit>().addToCart(productId: product.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: AppStyles.textBold16.copyWith(
                        color: AppColors.white,
                        fontFamily: GoogleFonts.gabarito().fontFamily,
                      ),
                    ),
                    Text(
                      'Add to Bag',
                      style: AppStyles.textRegular16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
