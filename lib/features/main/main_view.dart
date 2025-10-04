import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/features/home/presentation/views/home_view.dart';
import 'package:clot/features/orders/presentation/views/orders_view.dart';
import 'package:clot/features/profile/presentation/views/profile_view.dart';
import 'package:clot/features/watchlist/presentation/views/watchlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeView(),
    WatchlistView(),
    OrdersView(),
    ProfileView(),
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => changeTab(index),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.dark,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconHome,
              width: 40.w,
              color: _currentIndex == 0
                  ? AppColors.primary
                  : AppColors.white.withValues(alpha: 0.5),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconFav,
              width: 24.w,
              color: _currentIndex == 1
                  ? AppColors.primary.withValues(alpha: 0.65)
                  : AppColors.white.withValues(alpha: 0.2),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconOrders,
              width: 40.w,
              color: _currentIndex == 2
                  ? AppColors.primary
                  : AppColors.white.withValues(alpha: 0.5),
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconProfile,
              width: 40.w,
              color: _currentIndex == 3
                  ? AppColors.primary
                  : AppColors.white.withValues(alpha: 0.5),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
