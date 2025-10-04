import 'dart:developer';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/custom_error.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:clot/features/orders/presentation/widgets/custom_orders_loading.dart';
import 'package:clot/features/orders/presentation/widgets/no_orders.dart';
import 'package:clot/features/orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(20),
          Center(
            child: Text(
              'Your Orders',
              style: AppStyles.textBold16.copyWith(
                color: AppColors.white,
                fontFamily: GoogleFonts.gabarito().fontFamily,
              ),
            ),
          ),
          HeightBox(32),
          Expanded(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                log(Prefs.getCartId() ?? '');
                if (state is OrdersLoaded) {
                  if (state.orders.isEmpty ||
                      Prefs.getCartId() == null ||
                      Prefs.getCartId() == '') {
                    return const NoOrders();
                  }
                  return ListView.builder(
                    itemCount: state.orders.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        OrderItem(order: state.orders[index]),
                  );
                } else if (state is OrdersError) {
                  return CustomError(title: state.message);
                } else if (state is OrdersLoading) {
                  return CustomOrdersLoading();
                } else {
                  return const NoOrders();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
