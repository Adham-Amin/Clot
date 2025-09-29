import 'package:clot/features/brands/domain/repo/brands_repo.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit({required this.brandsRepo}) : super(BrandsInitial());

  final BrandsRepo brandsRepo;

  Future<void> getBrands() async {
    emit(BrandsLoading());
    final result = await brandsRepo.getBrands();
    result.fold(
      (l) => emit(BrandsError(message: l.message)),
      (r) => emit(BrandsLoaded(brands: r)),
    );
  }
}
