import 'package:clot/core/errors/failure.dart';
import 'package:clot/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:clot/features/checkout/data/models/response/cash_response/cash_response.dart';
import 'package:clot/features/checkout/data/models/response/visa_response/visa_response.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, CashResponse>> cash({
    required CheckoutRequest request,
    required String cartId,
  });
  Future<Either<Failure, VisaResponse>> visa({
    required CheckoutRequest request,
    required String cartId,
  });
}
