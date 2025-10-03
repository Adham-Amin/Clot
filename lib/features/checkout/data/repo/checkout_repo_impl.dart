import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:clot/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:clot/features/checkout/data/models/response/cash_response/cash_response.dart';
import 'package:clot/features/checkout/data/models/response/visa_response/visa_response.dart';
import 'package:clot/features/checkout/domain/repo/checkout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;
  CheckoutRepoImpl({required this.checkoutRemoteDataSource});

  @override
  Future<Either<Failure, CashResponse>> cash({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    try {
      final data = await checkoutRemoteDataSource.cash(
        request: request,
        cartId: cartId,
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

  @override
  Future<Either<Failure, VisaResponse>> visa({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    try {
      final data = await checkoutRemoteDataSource.visa(
        request: request,
        cartId: cartId,
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
