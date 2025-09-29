import 'package:clot/features/brands/domain/repo/brands_repo.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_by_brand_state.dart';

class ProductsByBrandCubit extends Cubit<ProductsByBrandState> {
  ProductsByBrandCubit({required this.brandsRepo})
    : super(ProductsByBrandInitial());

  final BrandsRepo brandsRepo;

  Future<void> getProductsByBrand({required String brandId}) async {
    emit(ProductsByBrandLoading());
    final result = await brandsRepo.getProductsByBrand(idBrand: brandId);
    result.fold(
      (l) => emit(ProductsByBrandError(message: l.message)),
      (r) => emit(ProductsByBrandLoaded(products: r)),
    );
  }
}
