import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/categories/domain/repo/categories_repo.dart';
import 'package:clot/features/categories/presentation/managers/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:clot/features/categories/presentation/widgets/products_category_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCategoryView extends StatelessWidget {
  const ProductsCategoryView({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsByCategoryCubit(categoriesRepo: getIt<CategoriesRepo>())
            ..getProductsByCategory(categoryId: category.id),
      child: Scaffold(
        body: SafeArea(
          child: ProductsCategoryViewBody(category: category.name),
        ),
      ),
    );
  }
}
