import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BrandsRepo {
  Future<Either<Failure, List<CategoryEntity>>> getBrands();
  Future<Either<Failure, List<ProductEntity>>> getProductsByBrand({
    required String idBrand,
  });
}
