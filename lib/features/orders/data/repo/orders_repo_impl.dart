import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/domain/repo/orders_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrdersRepoImpl extends OrdersRepo {
  final OrdersRemoteDataSource ordersRemoteDataSource;
  OrdersRepoImpl({required this.ordersRemoteDataSource});

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders({
    required String userId,
  }) async {
    try {
      final data = await ordersRemoteDataSource.getOrders(userId: userId);
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
