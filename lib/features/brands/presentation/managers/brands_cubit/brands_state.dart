part of 'brands_cubit.dart';

sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsLoaded extends BrandsState {
  final List<CategoryEntity> brands;
  BrandsLoaded({required this.brands});
}

final class BrandsError extends BrandsState {
  final String message;
  BrandsError({required this.message});
}
