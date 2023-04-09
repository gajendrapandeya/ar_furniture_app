import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishListState with _$WishListState {
  const factory WishListState.initial() = WishListStateInitial;
  const factory WishListState.loading() = WishListStateLoading;
  const factory WishListState.addToCart() = WishListStateAddedToWishList;
  const factory WishListState.removeFromCart() =
      WishListStateRemoveFromWishList;
  const factory WishListState.alreadyInCart() = WishListStateAlreadyInWishList;
  const factory WishListState.notInCart() = WishListStateNotInWishList;
  const factory WishListState.success({required List<Product> data}) =
      WishListStateSuccess;
  const factory WishListState.error({required String error}) =
      WishListStateError;
}
