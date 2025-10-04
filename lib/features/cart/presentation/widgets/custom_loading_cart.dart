import 'package:clot/core/widgets/custom_button.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/cart/domain/entities/product_cart_entity.dart';
import 'package:clot/features/cart/presentation/widgets/cart_item.dart';
import 'package:clot/features/cart/presentation/widgets/total_price_section.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingCart extends StatelessWidget {
  const CustomLoadingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CartItem(
                product: ProductCartEntity(
                  id: "id",
                  imageCover: 'imageCover',
                  title: 'title title',
                  count: 3,
                  price: 365.00,
                ),
              ),
            ),
          ),
          TotalPriceSection(totalPrice: 1236.00),
          HeightBox(16),
          Row(
            children: [
              Expanded(
                child: CustomButton(onTap: () {}, title: 'Checkout'),
              ),
            ],
          ),
          HeightBox(16),
        ],
      ),
    );
  }
}
