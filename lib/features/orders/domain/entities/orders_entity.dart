import 'package:clot/features/orders/domain/entities/orders_item_entity.dart';

class OrdersEntity {
  final num id;
  final List<OrdersItemEntity> items;

  OrdersEntity({required this.id, required this.items});
}
