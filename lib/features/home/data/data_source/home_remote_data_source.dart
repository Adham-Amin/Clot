import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/home/data/models/product_response/product_response.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ProductEntity>> getProducts() async {
    var response = await apiService.get(endPoint: '/products?limit=50');
    return (response['data'] as List)
        .map((e) => ProductResponse.fromJson(e).toEntity())
        .toList();
  }
}
