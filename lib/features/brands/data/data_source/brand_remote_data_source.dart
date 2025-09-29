import 'package:clot/core/services/api_service.dart';
import 'package:clot/features/brands/data/models/brands_response/brand_response.dart';
import 'package:clot/features/home/data/models/product_response/product_response.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';

abstract class BrandRemoteDataSource {
  Future<List<CategoryEntity>> getBrands();
  Future<List<ProductEntity>> getProductsByBrand({required String idBrand});
}

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final ApiService apiService;
  BrandRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<CategoryEntity>> getBrands() async {
    var response = await apiService.get(endPoint: '/brands?limit=50');
    return (response['data'] as List)
        .map((e) => BrandResponse.fromJson(e).toEntity())
        .toList();
  }

  @override
  Future<List<ProductEntity>> getProductsByBrand({
    required String idBrand,
  }) async {
    var response = await apiService.get(
      endPoint: '/products?limit=60&brand=$idBrand',
    );
    return (response['data'] as List)
        .map((e) => ProductResponse.fromJson(e).toEntity())
        .toList();
  }
}
