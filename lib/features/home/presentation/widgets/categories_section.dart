import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/core/widgets/category_item.dart';
import 'package:clot/core/widgets/loading_category_item.dart';
import 'package:clot/features/categories/presentation/managers/categories_cubit/categories_cubit.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return Column(
            children: [
              TitleAndSeeAll(
                title: 'Categories',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.categoriesView,
                    arguments: state.categories,
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
                        AppRoutes.productsCategoriesView,
                        arguments: state.categories[index],
                      );
                    },
                    category: state.categories[index],
                  ),
                ),
              ),
            ],
          );
        } else if (state is CategoriesError) {
          return Center(child: Text(state.message));
        } else {
          return LoadingCategoryItem();
        }
      },
    );
  }
}
