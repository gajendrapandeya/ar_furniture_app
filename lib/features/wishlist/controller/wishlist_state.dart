import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishListState<T> with _$WishListState<T> {
  const factory WishListState.initial() = WishListStateInitial;
  const factory WishListState.loading() = WishListStateLoading;
  const factory WishListState.addedToWishList() = WishListStateAddedToWishList;
  const factory WishListState.removeFromWishList() =
      WishListStateRemoveFromWishList;
  const factory WishListState.alreadyInWishList() =
      WishListStateAlreadyInWishList;
  const factory WishListState.notInWishList() = WishListStateNotInWishList;
  const factory WishListState.success({required T data}) = WishListStateSuccess;
  const factory WishListState.error({required String error}) =
      WishListStateError;
}
