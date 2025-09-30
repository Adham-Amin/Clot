import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/core/widgets/category_item.dart';
import 'package:clot/core/widgets/loading_category_item.dart';
import 'package:clot/features/brands/presentation/managers/brands_cubit/brands_cubit.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoaded) {
          return Column(
            children: [
              TitleAndSeeAll(
                title: 'Brands',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.brandsView,
                    arguments: state.brands,
                  );
                },
              ),
              HeightBox(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => CategoryItem(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productsBrandsView,
                        arguments: state.brands[index],
                      );
                    },
                    category: state.brands[index],
                  ),
                ),
              ),
            ],
          );
        } else if (state is BrandsError) {
          return Center(child: Text(state.message));
        } else {
          return LoadingCategoryItem();
        }
      },
    );
  }
}
