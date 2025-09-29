import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/brands/data/data_source/brand_remote_data_source.dart';
import 'package:clot/features/brands/domain/repo/brands_repo.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BrandsRepoImpl extends BrandsRepo {
  final BrandRemoteDataSource brandRemoteDataSource;
  BrandsRepoImpl({required this.brandRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getBrands() async {
    try {
      final data = await brandRemoteDataSource.getBrands();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByBrand({
    required String idBrand,
  }) async {
    try {
      final data = await brandRemoteDataSource.getProductsByBrand(
        idBrand: idBrand,
      );
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
