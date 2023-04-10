import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_controller.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_item_state.dart';
import 'package:ar_furniture_app/features/wishlist/service/wishlist_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishListItemProvider =
    StateNotifierProvider.family<WishlistNotifier, WishlistItemState, String>(
        (ref, productId) {
  return WishlistNotifier(
    ref.watch(wishListServiceProvider),
    ref,
  );
});

class WishlistNotifier extends StateNotifier<WishlistItemState> {
  WishlistNotifier(this._wishListService, this.ref)
      : super(const WishlistItemState.initial());

  final WishListService _wishListService;
  final Ref ref;

  void isInWishList({required String userId, required String productId}) async {
    try {
      final isInWishList = await _wishListService.isInWishList(
          userId: userId, productId: productId);
      state = isInWishList
          ? const WishlistItemState.success(isInWishlist: true)
          : const WishlistItemState.success(isInWishlist: false);
    } catch (error) {
      state = WishlistItemState.error(
        error: error.toString(),
      );
    }
  }

  void addProductToWishList(
      {required String userId, required Product product}) async {
    try {
      await _wishListService.addToWishList(product: product, userId: userId);
      state = const WishlistItemState.addedToWishlist();
    } catch (error) {
      state = WishlistItemState.error(
        error: error.toString(),
      );
    }
  }

  void removeProductFromWishList(
      {required String userId, required Product product}) async {
    try {
      await _wishListService.removeFromWishList(
          productId: product.id, userId: userId);
      _locallyRemoveEventFromCart(product);

      state = const WishlistItemStateRemoveFromWishlist();
    } catch (error) {
      state = WishlistItemState.error(
        error: error.toString(),
      );
    }
  }

  void _locallyRemoveEventFromCart(Product product) {
    ref.read(wishListProvider.notifier).removeFromWishlist(product: product);
  }
}
