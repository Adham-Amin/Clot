import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/home/data/data_source/home_remote_data_source.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final data = await homeRemoteDataSource.getProducts();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
