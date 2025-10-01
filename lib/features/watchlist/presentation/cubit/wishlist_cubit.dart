import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo watchlistRepo;

  WatchlistCubit({required this.watchlistRepo}) : super(WatchlistInitial());

  Future<void> loadWatchlist() async {
    emit(WatchlistLoading());
    try {
      final watchlist = await watchlistRepo.getWatchlist();
      emit(WatchlistLoaded(watchlist));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> toggleWatchlist(ProductEntity product) async {
    try {
      final isInWatchlist = await watchlistRepo.isProductInWatchlist(
        productId: product.id,
      );
      if (isInWatchlist) {
        await watchlistRepo.removeFromWatchlist(product: product);
      } else {
        await watchlistRepo.addToWatchlist(product: product);
      }
      await loadWatchlist();
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
}
