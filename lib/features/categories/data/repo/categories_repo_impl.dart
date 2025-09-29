import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/categories/domain/repo/categories_repo.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepoImpl({required this.categoriesRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final data = await categoriesRemoteDataSource.getCategories();
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
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
    required String idCategory,
  }) async {
    try {
      final data = await categoriesRemoteDataSource.getProductsByCategory(
        idCategory: idCategory,
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
