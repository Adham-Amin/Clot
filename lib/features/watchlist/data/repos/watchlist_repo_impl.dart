import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/watchlist/data/data_sources/local_watchlist_data_source.dart';
import 'package:clot/features/watchlist/domain/repos/watchlist_repo.dart';

class WatchlistRepoImpl extends WatchlistRepo {
  final LocalWatchlistDataSource localWatchlistDataSource;

  WatchlistRepoImpl({required this.localWatchlistDataSource});
  @override
  @override
  Future<void> addToWatchlist({required ProductEntity product}) async {
    final isInWatchlist = await localWatchlistDataSource.isProductInWatchlist(
      productId: product.id,
    );
    if (isInWatchlist) return;
    await localWatchlistDataSource.addToWatchlist(product: product);
  }

  @override
  Future<List<ProductEntity>> getWatchlist() async {
    var products = await localWatchlistDataSource.getWatchlist();
    return products;
  }

  @override
  Future<bool> isProductInWatchlist({required String productId}) async {
    return await localWatchlistDataSource.isProductInWatchlist(
      productId: productId,
    );
  }

  @override
  Future<void> removeFromWatchlist({required ProductEntity product}) async {
    await localWatchlistDataSource.removeFromWatchlist(product: product);
  }
}
