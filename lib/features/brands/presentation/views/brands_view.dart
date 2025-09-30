import 'package:clot/features/brands/presentation/widgets/brands_view_body.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key, required this.brands});

  final List<CategoryEntity> brands;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BrandsViewBody(brands: brands)),
    );
  }
}
