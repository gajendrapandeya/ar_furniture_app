import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartAmount {
  final int subTotal;
  final double shippingAndTaxesCost;
  final int total;

  CartAmount({
    required this.subTotal,
    required this.shippingAndTaxesCost,
    required this.total,
  });

  factory CartAmount.initial() =>
      CartAmount(subTotal: 0, shippingAndTaxesCost: 0, total: 0);

  CartAmount copyWith({
    int? subTotal,
    double? shippingAndTaxesCost,
    int? total,
  }) {
    return CartAmount(
      subTotal: subTotal ?? this.subTotal,
      shippingAndTaxesCost: shippingAndTaxesCost ?? this.shippingAndTaxesCost,
      total: total ?? this.total,
    );
  }
}

final cartAmountProvider =
    StateNotifierProvider<CartAmountController, CartAmount>((ref) {
  return CartAmountController();
});

class CartAmountController extends StateNotifier<CartAmount> {
  CartAmountController() : super(CartAmount.initial());

  void setSubtotal(int amount) => state = state.copyWith(subTotal: amount);
  void setTotal(int amount) => state = state.copyWith(total: amount);
  void setShippingAndTaxesCost(double amount) =>
      state = state.copyWith(shippingAndTaxesCost: amount);
}
