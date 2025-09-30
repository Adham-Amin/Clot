import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/core/widgets/product_item.dart';
import 'package:clot/features/home/presentation/managers/cubit/all_products_cubit.dart';
import 'package:clot/features/home/presentation/widgets/loading_top_selling.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsLoaded) {
          return Column(
            children: [
              TitleAndSeeAll(
                title: 'Top Selling',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productsView,
                    arguments: state.products,
                  );
                },
              ),
              HeightBox(12),
              SizedBox(
                height: 285.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => WidthBox(12),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductItem(product: state.products[index]);
                  },
                ),
              ),
            ],
          );
        } else if (state is AllProductsError) {
          return Center(
            child: Text(
              state.message,
              style: AppStyles.textBold16.copyWith(color: AppColors.white),
            ),
          );
        } else {
          return LoadingTopSelling();
        }
      },
    );
  }
}
