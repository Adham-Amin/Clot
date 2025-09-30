import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/brands/domain/repo/brands_repo.dart';
import 'package:clot/features/brands/presentation/managers/brands_cubit/brands_cubit.dart';
import 'package:clot/features/categories/domain/repo/categories_repo.dart';
import 'package:clot/features/categories/presentation/managers/categories_cubit/categories_cubit.dart';
import 'package:clot/features/home/domain/repos/home_repo.dart';
import 'package:clot/features/home/presentation/managers/cubit/all_products_cubit.dart';
import 'package:clot/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AllProductsCubit(homeRepo: getIt<HomeRepo>())..getAllProducts(),
        ),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(categoriesRepo: getIt<CategoriesRepo>())
                ..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              BrandsCubit(brandsRepo: getIt<BrandsRepo>())..getBrands(),
        ),
      ],
      child: const Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
