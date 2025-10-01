import 'package:clot/features/home/domain/entities/product_entity.dart';

abstract class WatchlistRepo {
  Future<void> addToWatchlist({required ProductEntity product});
  Future<void> removeFromWatchlist({required ProductEntity product});
  Future<bool> isProductInWatchlist({required String productId});
  Future<List<ProductEntity>> getWatchlist();
}
