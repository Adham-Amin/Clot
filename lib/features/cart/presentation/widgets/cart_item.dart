import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/cart/domain/entities/product_cart_entity.dart';
import 'package:clot/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot/features/cart/presentation/widgets/add_or_del_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});

  final ProductCartEntity product;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          context.read<CartCubit>().removeFromCart(productId: product.id),
      background: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: AppColors.dark),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 64.w,
              height: 64.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: product.imageCover,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            WidthBox(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textRegular12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppStyles.textBold12.copyWith(
                          color: AppColors.white,
                          fontFamily: GoogleFonts.gabarito().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  HeightBox(8),
                  Row(
                    children: [
                      Text(
                        'Quantity - ',
                        style: AppStyles.textRegular12.copyWith(
                          color: AppColors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      Text(
                        '${product.count}',
                        style: AppStyles.textBold12.copyWith(
                          color: AppColors.white,
                          fontFamily: GoogleFonts.gabarito().fontFamily,
                        ),
                      ),
                      Spacer(),
                      AddOrDelButton(
                        onTap: () {
                          context.read<CartCubit>().updateProductFromCart(
                            productId: product.id,
                            count: (product.count - 1).toString(),
                          );
                        },
                        isAdd: false,
                      ),
                      WidthBox(8),
                      AddOrDelButton(
                        onTap: () {
                          context.read<CartCubit>().updateProductFromCart(
                            productId: product.id,
                            count: (product.count + 1).toString(),
                          );
                        },
                        isAdd: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
