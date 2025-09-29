import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
