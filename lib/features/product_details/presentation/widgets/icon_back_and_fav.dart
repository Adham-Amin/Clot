import 'package:clot/core/widgets/custom_back_icon.dart';
import 'package:clot/core/widgets/custom_icon_fav_button.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class IconBackAndFav extends StatelessWidget {
  const IconBackAndFav({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackIcon(),
        CustomIconFavButton(product: product),
      ],
    );
  }
}
