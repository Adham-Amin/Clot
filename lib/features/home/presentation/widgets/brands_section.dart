import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/presentation/widgets/category_item.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeAll(title: 'Brands', onTap: () {}),
        HeightBox(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) => CategoryItem()),
        ),
      ],
    );
  }
}
