import 'package:clot/core/di/service_locator.dart';
import 'package:clot/features/brands/domain/repo/brands_repo.dart';
import 'package:clot/features/brands/presentation/managers/products_by_brand_cubit/products_by_brand_cubit.dart';
import 'package:clot/features/brands/presentation/widgets/products_brand_view_body.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBrandView extends StatelessWidget {
  const ProductsBrandView({super.key, required this.brand});

  final CategoryEntity brand;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsByBrandCubit(brandsRepo: getIt<BrandsRepo>())
            ..getProductsByBrand(brandId: brand.id),
      child: Scaffold(
        body: SafeArea(child: ProductsBrandViewBody(brand: brand.name)),
      ),
    );
  }
}
