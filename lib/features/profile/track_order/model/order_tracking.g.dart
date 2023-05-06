// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTracking _$$_OrderTrackingFromJson(Map<String, dynamic> json) =>
    _$_OrderTracking(
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_OrderTrackingToJson(_$_OrderTracking instance) =>
    <String, dynamic>{
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'updatedAt': instance.updatedAt,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ordered: 'ordered',
  OrderStatus.inProcess: 'inProcess',
  OrderStatus.inTransit: 'inTransit',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
