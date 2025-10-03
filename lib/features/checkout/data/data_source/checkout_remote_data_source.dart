import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:clot/features/checkout/data/models/response/cash_response/cash_response.dart';
import 'package:clot/features/checkout/data/models/response/visa_response/visa_response.dart';

abstract class CheckoutRemoteDataSource {
  Future<VisaResponse> visa({
    required CheckoutRequest request,
    required String cartId,
  });
  Future<CashResponse> cash({
    required CheckoutRequest request,
    required String cartId,
  });
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiService apiService;
  CheckoutRemoteDataSourceImpl({required this.apiService});

  @override
  Future<CashResponse> cash({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    final response = await apiService.post(
      endPoint: '/orders/$cartId',
      data: request.toJson(),
    );
    return CashResponse.fromJson(response);
  }

  @override
  Future<VisaResponse> visa({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    final response = await apiService.post(
      endPoint: '/orders/checkout-session/$cartId?url=http://localhost:3000',
      data: request.toJson(),
    );
    return VisaResponse.fromJson(response);
  }
}
