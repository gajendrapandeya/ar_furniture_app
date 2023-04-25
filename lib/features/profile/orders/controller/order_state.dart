import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.loading() = OrderStateLoading;
  const factory OrderState.success({required List<ProductOrder> orders}) =
      OrderStateSuccess;
  const factory OrderState.failure({required String error}) = OrderStateFailure;
}
