import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:clot/features/watchlist/presentation/cubit/wishlist_state.dart';
import 'package:clot/features/watchlist/presentation/widgets/fav_is_empty.dart';
import 'package:clot/features/watchlist/presentation/widgets/fav_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchlistViewBody extends StatelessWidget {
  const WatchlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(32),
          Center(
            child: Text(
              'My Favourites',
              style: AppStyles.textBold16.copyWith(
                color: AppColors.white,
                fontFamily: GoogleFonts.gabarito().fontFamily,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<WatchlistCubit, WatchlistState>(
              builder: (context, state) {
                if (state is WatchlistLoaded) {
                  if (state.watchlist.isEmpty) {
                    return FavIsEmpty();
                  }
                  return FavList(products: state.watchlist);
                } else if (state is WatchlistError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: AppStyles.textBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                } else {
                  return FavIsEmpty();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
