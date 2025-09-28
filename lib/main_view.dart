import 'package:clot/core/utils/app_assets.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Favorites')),
    Center(child: Text('Orders')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.dark,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.white.withValues(alpha: 0.5),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svgsIconHome),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svgsIconSerch),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svgsIconFav),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svgsIconOrder),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svgsIconProfile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
