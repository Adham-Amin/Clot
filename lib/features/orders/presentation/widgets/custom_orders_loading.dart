import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/domain/entities/orders_item_entity.dart';
import 'package:clot/features/orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomOrdersLoading extends StatelessWidget {
  const CustomOrdersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => OrderItem(
          order: OrdersEntity(
            id: 12345,
            address: 'address',
            phone: '',
            items: [
              OrdersItemEntity(
                image: ' ',
                title: '             ',
                count: 0,
                price: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
