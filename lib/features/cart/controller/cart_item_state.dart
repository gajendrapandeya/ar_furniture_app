import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_state.freezed.dart';

@freezed
abstract class CartItemState with _$CartItemState {
  const factory CartItemState.initial() = CartItemStateInitial;
  const factory CartItemState.loading() = CartItemStateLoading;
  const factory CartItemState.success({required bool isInCart}) =
      CartItemStateSuccess;
  const factory CartItemState.error({required String error}) =
      CartItemStateError;

  const factory CartItemState.addedToCart() = CartItemStateAddedToCart;
  const factory CartItemState.removedFromCart() = CartItemStateRemovedFromCart;
}
