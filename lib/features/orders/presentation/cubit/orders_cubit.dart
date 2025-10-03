import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/domain/repo/orders_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitial());

  final OrdersRepo ordersRepo;

  Future<void> getOrders({required String userId}) async {
    emit(OrdersLoading());
    final result = await ordersRepo.getOrders(userId: userId);
    result.fold(
      (l) => emit(OrdersError(message: l.message)),
      (r) => emit(OrdersLoaded(orders: r)),
    );
  }
}
