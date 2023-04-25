import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/track_order/model/timeline_content.dart';
import 'package:flutter/material.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget({
    super.key,
    required this.orderStatus,
    required this.updatedAt,
  });

  final OrderStatus orderStatus;
  final String updatedAt;

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  final List<TimelineContent> _timelineList = [];

  @override
  void initState() {
    super.initState();
    switch (widget.orderStatus) {
      case OrderStatus.ordered:
        // _timelineList.add(TimelineContent(title: '', updatedDate: widget.updatedAt, iconData: iconData))
        break;
      case OrderStatus.inProcess:
        // TODO: Handle this case.
        break;
      case OrderStatus.delivered:
        // TODO: Handle this case.
        break;
      case OrderStatus.cancelled:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
