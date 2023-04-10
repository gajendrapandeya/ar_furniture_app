import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_state.dart';
import 'package:ar_furniture_app/features/wishlist/service/wishlist_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishListProvider =
    StateNotifierProvider<WishlistController, WishListState>((ref) {
  return WishlistController(
    wishListService: ref.watch(wishListServiceProvider),
  );
});

class WishlistController extends StateNotifier<WishListState> {
  final WishListService _wishListService;

  WishlistController({required WishListService wishListService})
      : _wishListService = wishListService,
        super(const WishListState.initial());

  void fetchProductsInWishList({required String userId}) async {
    try {
      state = const WishListState.loading();
      final products =
          await _wishListService.fetchProductsInWishList(userId: userId);
      state = WishListState.success(data: products);
    } catch (error) {
      state = WishListState.error(
        error: error.toString(),
      );
    }
  }

  void removeFromWishlist({required Product product}) {
    final wishlistItems = [...(state as WishListStateSuccess).data];
    wishlistItems.remove(product);
    state = WishListStateSuccess(data: wishlistItems);
  }
}
