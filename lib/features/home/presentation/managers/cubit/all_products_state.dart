part of 'all_products_cubit.dart';

sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsLoading extends AllProductsState {}

final class AllProductsLoaded extends AllProductsState {
  final List<ProductEntity> products;
  AllProductsLoaded({required this.products});
}

final class AllProductsError extends AllProductsState {
  final String message;
  AllProductsError({required this.message});
}
