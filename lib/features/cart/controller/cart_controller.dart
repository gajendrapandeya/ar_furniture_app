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

  void fetchProductsInCart({required String userId}) async {
    try {
      state = const CartStateLoading();
      final products = await _cartService.fetchProductsInCart(userId: userId);

      state = CartState.success(data: products);
    } catch (error) {
      state = CartState.error(
        error: error.toString(),
      );
    }
  }

  void removeFromCart({required Cart cart}) {
    final cartItems = [...(state as CartStateSuccess).data];
    cartItems.remove(cart);
    state = CartStateSuccess(data: cartItems);
  }
}
