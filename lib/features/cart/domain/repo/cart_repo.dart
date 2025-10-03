import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/cart/domain/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart({required String productId});
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> removeFromCart({
    required String productId,
  });
  Future<Either<Failure, CartEntity>> updateProductFromCart({
    required String productId,
    required String count,
  });
}
