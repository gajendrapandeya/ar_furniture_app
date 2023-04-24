import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_model.freezed.dart';

@freezed
class CheckoutModel with _$CheckoutModel {
  const CheckoutModel._();
  const factory CheckoutModel({
    required Address? selectedAddress,
    @Default(ProductPaymentMethod.cod) ProductPaymentMethod paymentMethod,
    required CardDetail? cardDetail,
    required String? paymentId,
  }) = _CheckoutModel;

  factory CheckoutModel.initial() => const CheckoutModel(
        selectedAddress: null,
        paymentId: null,
        cardDetail: null,
      );
}
