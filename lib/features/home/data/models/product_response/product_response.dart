import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class ProductResponse {
  num? sold;
  List<dynamic>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductResponse({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      sold: json['sold'] as num?,
      images: json['images'] as List<dynamic>?,
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsQuantity: json['ratingsQuantity'] as num?,
      id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as num?,
      price: json['price'] as int?,
      imageCover: json['imageCover'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'sold': sold,
    'images': images,
    'subcategory': subcategory?.map((e) => e.toJson()).toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': id,
    'title': title,
    'slug': slug,
    'description': description,
    'quantity': quantity,
    'price': price,
    'imageCover': imageCover,
    'category': category?.toJson(),
    'brand': brand?.toJson(),
    'ratingsAverage': ratingsAverage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };

  ProductEntity toEntity() => ProductEntity(
    brand: CategoryEntity(
      id: brand?.id ?? '',
      image: brand?.image ?? '',
      name: brand?.name ?? '',
    ),
    images: images ?? [],
    id: id ?? '',
    title: title ?? '',
    description: description ?? '',
    quantity: quantity ?? 0,
    price: price ?? 0,
    imageCover: imageCover ?? '',
    rating: ratingsAverage ?? 0,
  );
}
