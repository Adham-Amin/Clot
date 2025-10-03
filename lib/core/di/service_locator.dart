import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clot/features/auth/data/repos/auth_repo_impl.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
import 'package:clot/features/brands/data/data_source/brand_remote_data_source.dart';
import 'package:clot/features/brands/data/repo/brands_repo_impl.dart';
import 'package:clot/features/brands/domain/repo/brands_repo.dart';
import 'package:clot/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:clot/features/cart/data/repo/cart_repo_impl.dart';
import 'package:clot/features/cart/domain/repo/cart_repo.dart';
import 'package:clot/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:clot/features/categories/data/repo/categories_repo_impl.dart';
import 'package:clot/features/categories/domain/repo/categories_repo.dart';
import 'package:clot/features/home/data/data_source/home_remote_data_source.dart';
import 'package:clot/features/home/data/repos/home_repo_impl.dart';
import 'package:clot/features/home/domain/repos/home_repo.dart';
import 'package:clot/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:clot/features/orders/data/repo/orders_repo_impl.dart';
import 'package:clot/features/orders/domain/repo/orders_repo.dart';
import 'package:clot/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:clot/features/profile/data/repos/profile_repo_impl.dart';
import 'package:clot/features/profile/domain/repos/profile_repo.dart';
import 'package:clot/features/watchlist/data/data_sources/local_watchlist_data_source.dart';
import 'package:clot/features/watchlist/data/repos/watchlist_repo_impl.dart';
import 'package:clot/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  getIt.registerLazySingleton<BrandRemoteDataSource>(
    () => BrandRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<BrandsRepo>(
    () => BrandsRepoImpl(brandRemoteDataSource: getIt<BrandRemoteDataSource>()),
  );

  getIt.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(
      categoriesRemoteDataSource: getIt<CategoriesRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<LocalWatchlistDataSource>(
    () => LocalWatchlistDataSourceImpl(),
  );

  getIt.registerLazySingleton<WatchlistRepo>(
    () => WatchlistRepoImpl(
      localWatchlistDataSource: getIt<LocalWatchlistDataSource>(),
    ),
  );

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      profileRemoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartRemoteDataSource: getIt<CartRemoteDataSource>()),
  );

  getIt.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<OrdersRepo>(
    () =>
        OrdersRepoImpl(ordersRemoteDataSource: getIt<OrdersRemoteDataSource>()),
  );
}
