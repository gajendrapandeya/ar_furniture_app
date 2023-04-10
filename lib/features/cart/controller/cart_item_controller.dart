import 'package:ar_furniture_app/features/cart/controller/cart_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_item_state.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/cart/service/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartItemProvider =
    StateNotifierProvider<CartItemNotifier, CartItemState>((ref) {
  return CartItemNotifier(ref);
});

class CartItemNotifier extends StateNotifier<CartItemState> {
  CartItemNotifier(this._ref)
      : super(
          const CartItemState.initial(),
        );

  final _cartService = CartService.instance;
  final Ref _ref;

  void inInCart({required String userId, required String cartId}) async {
    try {
      final isInCart = await _cartService.isProductAlreadyInCart(
        userId: userId,
        cartId: cartId,
      );
      state = isInCart
          ? const CartItemState.success(isInCart: true)
          : const CartItemState.success(isInCart: false);
    } catch (error) {
      state = CartItemState.error(error: error.toString());
    }
  }

  void addProductToCart({required String userId, required Cart cart}) async {
    try {
      await _cartService.addProductToCart(cart: cart, userId: userId);
      state = const CartItemState.addedToCart();
    } catch (error) {
      state = CartItemState.error(
        error: error.toString(),
      );
    }
  }

  void removeProductFromCart(
      {required String userId, required Cart cart}) async {
    try {
      await _cartService.removeProductFromCart(cartId: cart.id, userId: userId);
      _locallyRemoveItemFromCart(cart);
      state = const CartItemState.removedFromCart();
    } catch (error) {
      state = CartItemState.error(
        error: error.toString(),
      );
    }
  }

  void _locallyRemoveItemFromCart(Cart cart) {
    _ref.read(cartProvider.notifier).removeFromCart(cart: cart);
  }
}
