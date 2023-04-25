import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:flutter/material.dart';

class OrderProgressWidget extends StatelessWidget {
  const OrderProgressWidget({
    super.key,
    required this.orderStatus,
  });

  final OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Container(
          width: _getWidthBasedOnOrderStatus(context),
          decoration: BoxDecoration(
            color: LightColor.platianGreen,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  double _getWidthBasedOnOrderStatus(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    switch (orderStatus) {
      case OrderStatus.ordered:
        return screenWidth * 0.25;
      case OrderStatus.inProcess:
        return screenWidth * 0.5;
      case OrderStatus.delivered:
        return screenWidth;
      case OrderStatus.cancelled:
        return 0;
    }
  }
}
