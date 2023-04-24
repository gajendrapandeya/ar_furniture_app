// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/checkout/model/checkout_model.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutNotifier =
    StateNotifierProvider<CheckoutNotifier, CheckoutModel>((ref) {
  return CheckoutNotifier();
});

class CheckoutNotifier extends StateNotifier<CheckoutModel> {
  CheckoutNotifier() : super(CheckoutModel.initial());

  void setSelectedAddress({required Address address}) {
    state = state.copyWith(selectedAddress: address);
  }

  void setPaymentMethod({required ProductPaymentMethod paymentMethod}) {
    state = state.copyWith(paymentMethod: paymentMethod);
  }

  void setPaymentId({required String paymentId}) {
    state = state.copyWith(paymentId: paymentId);
  }

  void setCardDetails({required CardDetail cardDetail}) {
    state = state.copyWith(cardDetail: cardDetail);
  }
}
