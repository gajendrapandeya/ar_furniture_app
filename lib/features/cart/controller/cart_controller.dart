import 'package:ar_furniture_app/features/cart/controller/cart_state.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/cart/service/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartController, CartState>((ref) {
  return CartController();
});

class CartController extends StateNotifier<CartState> {
  CartController() : super(const CartState.initial());

  final _cartService = CartService.instance;

  void inInCart({required String userId, required String cartId}) async {
    try {
      final isInCart = await _cartService.isProductAlreadyInCart(
        userId: userId,
        cartId: cartId,
      );
      state = isInCart
          ? const CartStateAlreadyInCart()
          : const CartStateNotInCart();
    } catch (error) {
      state = CartState.error(
        error: error.toString(),
      );
    }
  }

  void addProductToCart({required String userId, required Cart cart}) async {
    try {
      await _cartService.addProductToCart(cart: cart, userId: userId);
      state = const CartState.addedToCart();
    } catch (error) {
      state = CartState.error(
        error: error.toString(),
      );
    }
  }

  void removeProductFromCart(
      {required String userId, required String cartId}) async {
    try {
      await _cartService.removeProductFromCart(cartId: cartId, userId: userId);
      state = const CartState.removeFromCart();
    } catch (error) {
      state = CartState.error(
        error: error.toString(),
      );
    }
  }

  void fetchProductsInCart({required String userId}) async {
    try {
      final products = await _cartService.fetchProductsInCart(userId: userId);

      state = CartState.success(data: products);
    } catch (error) {
      state = CartState.error(
        error: error.toString(),
      );
    }
  }
}
