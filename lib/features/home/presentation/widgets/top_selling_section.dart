import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/presentation/widgets/product_item.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeAll(title: 'Top Selling', onTap: () {}),
        HeightBox(12),
        SizedBox(
          height: 285.h,
          child: ListView.separated(
            separatorBuilder: (context, index) => WidthBox(12),
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem();
            },
          ),
        ),
      ],
    );
  }
}
