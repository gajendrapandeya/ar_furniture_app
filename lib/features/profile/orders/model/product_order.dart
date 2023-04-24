import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_order.freezed.dart';
part 'product_order.g.dart';

enum OrderStatus {
  @JsonValue('ordered')
  ordered,
  @JsonValue('inProcess')
  inProcess,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
}

enum ProductPaymentMethod {
  @JsonValue('cod')
  cod,
  @JsonValue('stripe')
  stripe,
}

@freezed
class ProductOrder with _$ProductOrder {
  const factory ProductOrder({
    required String orderId,
    required String userId,
    required List<Cart> product,
    required int totalAmount,
    required Address userAddress,
    required String? paymentId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required OrderStatus orderStatus,
    required ProductPaymentMethod paymentMethod,
  }) = _Order;

  factory ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderFromJson(json);
}
