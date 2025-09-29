part of 'products_by_brand_cubit.dart';

sealed class ProductsByBrandState {}

final class ProductsByBrandInitial extends ProductsByBrandState {}

final class ProductsByBrandLoading extends ProductsByBrandState {}

final class ProductsByBrandLoaded extends ProductsByBrandState {
  final List<ProductEntity> products;
  ProductsByBrandLoaded({required this.products});
}

final class ProductsByBrandError extends ProductsByBrandState {
  final String message;
  ProductsByBrandError({required this.message});
}
