import 'package:ar_furniture_app/features/profile/orders/controller/order_state.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/orders/service/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>((ref) {
  return OrderNotifier(
    orderService: ref.watch(orderServiceProvider),
  );
});

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier({required OrderService orderService})
      : _orderService = orderService,
        super(const OrderState.loading());

  final OrderService _orderService;

  Future<void> createOrder({required ProductOrder order}) async {
    try {
      state = const OrderState.loading();
      await _orderService.createOrder(
        order: order,
      );
      state = const OrderState.success();
    } catch (error) {
      state = OrderState.failure(error: error.toString());
    }
  }
}
