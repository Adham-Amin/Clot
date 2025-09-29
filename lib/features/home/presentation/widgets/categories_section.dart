import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/presentation/widgets/category_item.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeAll(title: 'Categories', onTap: () {}),
        HeightBox(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) => CategoryItem()),
        ),
      ],
    );
  }
}
