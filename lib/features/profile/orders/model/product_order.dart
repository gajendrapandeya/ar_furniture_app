import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_order.freezed.dart';
part 'product_order.g.dart';

enum OrderStatus {
  ordered,
  inProcess,
  delivered,
  cancelled,
}

enum ProductPaymentMethod {
  cod,
  stripe,
}

@freezed
class ProductOrder with _$ProductOrder {
  const factory ProductOrder({
    required String orderId,
    required String userId,
    required List<Product> product,
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
