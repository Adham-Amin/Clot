class ProductEntity {
  final String id;
  final List<dynamic> images;
  final String title;
  final String description;
  final num price;
  final num rating;
  final num quantity;
  final String imageCover;

  ProductEntity({
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
