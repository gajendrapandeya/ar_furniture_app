import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_item_state.freezed.dart';

@freezed
abstract class WishlistItemState with _$WishlistItemState {
  const factory WishlistItemState.initial() = WishlistItemStateInitial;
  const factory WishlistItemState.loading() = WishlistItemStateLoading;
  const factory WishlistItemState.success({required bool isInWishlist}) =
      WishlistItemStateSuccess;
  const factory WishlistItemState.error({required String error}) =
      WishlistItemStateError;

  const factory WishlistItemState.addedToWishlist() =
      WishlistItemStateAddedtoWishlist;
  const factory WishlistItemState.removeFromWishlist() =
      WishlistItemStateRemoveFromWishlist;
}
