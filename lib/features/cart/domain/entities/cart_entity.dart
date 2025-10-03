import 'package:clot/features/cart/domain/entities/product_cart_entity.dart';

class CartEntity {
  final num totalPrice;
  final List<ProductCartEntity> products;

  CartEntity({required this.totalPrice, required this.products});
}
