import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrdersEntity>>> getOrders({
    required String userId,
  });
}
