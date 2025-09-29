import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit({required this.homeRepo}) : super(AllProductsInitial());

  final HomeRepo homeRepo;

  Future<void> getAllProducts() async {
    emit(AllProductsLoading());
    final result = await homeRepo.getProducts();
    result.fold(
      (failure) => emit(AllProductsError(message: failure.message)),
      (products) => emit(AllProductsLoaded(products: products)),
    );
  }
}
