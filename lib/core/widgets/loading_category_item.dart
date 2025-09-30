import 'package:clot/core/widgets/category_item.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingCategoryItem extends StatelessWidget {
  const LoadingCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          TitleAndSeeAll(title: 'Categories', onTap: () {}),
          HeightBox(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => CategoryItem(
                category: CategoryEntity(id: '', image: 'image', name: 'name'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
