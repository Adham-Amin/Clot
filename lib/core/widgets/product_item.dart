import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productDetailsView,
          arguments: product,
        );
      },
      child: Stack(
        children: [
          Container(
            width: 160.w,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  child: AspectRatio(
                    aspectRatio: 160 / 220,
                    child: CachedNetworkImage(
                      imageUrl: product.imageCover,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Skeletonizer(
                        child: Image.asset(AppAssets.imagesTestC),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                HeightBox(8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    product.title,
                    maxLines: 1,
                    style: AppStyles.textRegular12.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                HeightBox(8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: AppStyles.textBold12.copyWith(
                          color: AppColors.white,
                          fontFamily: GoogleFonts.gabarito().fontFamily,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${product.rating}',
                        style: AppStyles.textRegular12.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      WidthBox(4),
                      Icon(Icons.star, color: AppColors.yellow, size: 16.sp),
                      WidthBox(4),
                    ],
                  ),
                ),
                HeightBox(16),
              ],
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppAssets.svgsIconFav),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
