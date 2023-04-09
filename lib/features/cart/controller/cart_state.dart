import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartStateInitial;
  const factory CartState.loading() = CartStateLoading;
  const factory CartState.addedToCart() = CartStateAddedToCart;
  const factory CartState.removeFromCart() = CartStateRemovefromCart;
  const factory CartState.alreadyInCart() = CartStateAlreadyInCart;
  const factory CartState.notInCart() = CartStateNotInCart;
  const factory CartState.success({required List<Cart> data}) =
      CartStateSuccess;
  const factory CartState.error({required String error}) = CartStateError;
}
