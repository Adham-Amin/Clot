import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/orders/data/models/orders_response/orders_response.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrdersEntity>> getOrders({required String userId});
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiService apiService;
  OrdersRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<OrdersEntity>> getOrders({required String userId}) async {
    final response = await apiService.get(endPoint: '/orders/user/$userId');
    List<OrdersEntity> orders = [];
    for (var order in response) {
      orders.add(OrdersResponse.fromJson(order).toEntity());
    }
    return orders;
  }
}
