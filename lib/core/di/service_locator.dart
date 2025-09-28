import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clot/features/auth/data/repos/auth_repo_impl.dart';
import 'package:clot/features/auth/domain/repos/auth_repo.dart';
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
}
