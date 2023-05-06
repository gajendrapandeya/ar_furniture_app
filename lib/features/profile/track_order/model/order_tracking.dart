import 'package:ar_furniture_app/core/utils/date_time_utils.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part 'order_tracking.freezed.dart';
part 'order_tracking.g.dart';

@freezed
class OrderTracking with _$OrderTracking {
  const OrderTracking._();
  const factory OrderTracking({
    required OrderStatus orderStatus,
    required String updatedAt,
  }) = _OrderTracking;

  factory OrderTracking.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackingFromJson(json);

  IconData getIconDataBasedOnOrderStatus() {
    switch (orderStatus) {
      case OrderStatus.ordered:
        return MdiIcons.packageVariant;
      case OrderStatus.inProcess:
        return MdiIcons.packageVariantClosed;
      case OrderStatus.inTransit:
        return MdiIcons.truckOutline;
      case OrderStatus.delivered:
        return MdiIcons.packageVariantClosedCheck;

      case OrderStatus.cancelled:
        return MdiIcons.archiveCancelOutline;
    }
  }

  String getTitleBasedOnOrderStatus() {
    switch (orderStatus) {
      case OrderStatus.ordered:
        return 'Parcel Prepared - not yet handed over the courier.';
      case OrderStatus.inProcess:
        return 'Parcel handed over to the courier.';
      case OrderStatus.inTransit:
        return 'Parcel in transit.';
      case OrderStatus.delivered:
        return 'Product delivered successfully.';
      case OrderStatus.cancelled:
        return 'Product Cancelled by the user.';
    }
  }

  String get formattedUpdatedAt => DateTime.parse(updatedAt).getFormattedDate();
}
