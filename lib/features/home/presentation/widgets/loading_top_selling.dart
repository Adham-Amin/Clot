import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/core/widgets/product_item.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingTopSelling extends StatelessWidget {
  const LoadingTopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
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
                return ProductItem(
                  product: ProductEntity(
                    brand: CategoryEntity(id: '', image: '', name: ''),
                    id: '',
                    imageCover: '',
                    title: '',
                    price: 0,
                    quantity: 0,
                    description: '',
                    images: [],
                    rating: 0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
