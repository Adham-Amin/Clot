import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/categories/domain/repo/categories_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final result = await categoriesRepo.getCategories();
    result.fold(
      (l) => emit(CategoriesError(message: l.message)),
      (r) => emit(CategoriesLoaded(categories: r)),
    );
  }
}
