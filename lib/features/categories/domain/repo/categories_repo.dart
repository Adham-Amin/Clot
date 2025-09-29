import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
    required String idCategory,
  });
}
