import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<dynamic> images;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rating;
  @HiveField(6)
  final num quantity;
  @HiveField(7)
  final String imageCover;
  @HiveField(8)
  final CategoryEntity brand;

  ProductEntity({
    required this.brand,
    required this.imageCover,
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.quantity,
  });
}
