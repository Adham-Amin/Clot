import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/categories/presentation/widgets/categories_view_body.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CategoriesViewBody(categories: categories)),
    );
  }
}
