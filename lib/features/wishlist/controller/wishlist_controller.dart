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

  void isInWishList({required String userId, required String productId}) async {
    try {
      final isInWishList = await _wishListService.isInWishList(
          userId: userId, productId: productId);
      state = isInWishList
          ? const WishListState.alreadyInWishList()
          : const WishListState.notInWishList();
    } catch (error) {
      state = WishListState.error(
        error: error.toString(),
      );
    }
  }

  void addProductToWishList(
      {required String userId, required Product product}) async {
    try {
      await _wishListService.addToWishList(product: product, userId: userId);
      state = const WishListState.addedToWishList();
    } catch (error) {
      state = WishListState.error(
        error: error.toString(),
      );
    }
  }

  void removeProductFromWishList(
      {required String userId, required String productId}) async {
    try {
      await _wishListService.removeFromWishList(
          productId: productId, userId: userId);
      state = const WishListState.removeFromWishList();
    } catch (error) {
      state = WishListState.error(
        error: error.toString(),
      );
    }
  }

  void fetchProductsInWishList({required String userId}) async {
    try {
      final products =
          await _wishListService.fetchProductsInWishList(userId: userId);
      state = WishListState.success(data: products);
    } catch (error) {
      state = WishListState.error(
        error: error.toString(),
      );
    }
  }
}
