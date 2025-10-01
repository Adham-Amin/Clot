import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:clot/features/watchlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconFavButton extends StatelessWidget {
  const CustomIconFavButton({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, state) {
        final isInWatchlist =
            state is WatchlistLoaded && state.watchlist.contains(product);
        return GestureDetector(
          onTap: () {
            context.read<WatchlistCubit>().toggleWatchlist(product);
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              isInWatchlist ? AppAssets.svgsIconLove : AppAssets.svgsIconFav,
            ),
          ),
        );
      },
    );
  }
}
