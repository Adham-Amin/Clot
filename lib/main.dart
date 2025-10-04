import 'package:clot/core/di/service_locator.dart';
import 'package:clot/core/functions/execute_to_navigator.dart';
import 'package:clot/core/routes/on_generate_route.dart';
import 'package:clot/core/services/custom_observer_bloc.dart';
import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/features/cart/domain/repo/cart_repo.dart';
import 'package:clot/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/orders/domain/repo/orders_repo.dart';
import 'package:clot/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:clot/features/profile/domain/repos/profile_repo.dart';
import 'package:clot/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:clot/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:clot/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  await Hive.initFlutter();

  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());

  await Hive.openBox<ProductEntity>('watchlist');

  serverLocator();
  Bloc.observer = CustomObserverBloc();
  await getIt<CartRepo>().getCart();
  runApp(const Clot());
}

class Clot extends StatelessWidget {
  const Clot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                WatchlistCubit(watchlistRepo: getIt<WatchlistRepo>())
                  ..loadWatchlist(),
          ),
          BlocProvider(
            create: (context) =>
                AddressCubit(profileRepo: getIt<ProfileRepo>())..getAddress(),
          ),
          BlocProvider(
            create: (context) =>
                CartCubit(cartRepo: getIt<CartRepo>())..getCart(),
          ),
          BlocProvider(
            create: (context) => OrdersCubit(ordersRepo: getIt<OrdersRepo>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.plusJakartaSansTextTheme(),
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.dark,
          ),
          initialRoute: executeToNavigator(),
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
