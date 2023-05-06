// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      orderId: json['orderId'] as String,
      userId: json['userId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['totalAmount'] as int,
      userAddress:
          Address.fromJson(json['userAddress'] as Map<String, dynamic>),
      paymentId: json['paymentId'] as String?,
      createdAt: json['createdAt'] as String,
      trackings: (json['trackings'] as List<dynamic>)
          .map((e) => OrderTracking.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] as String,
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      paymentMethod:
          $enumDecode(_$ProductPaymentMethodEnumMap, json['paymentMethod']),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'userId': instance.userId,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'totalAmount': instance.totalAmount,
      'userAddress': instance.userAddress.toJson(),
      'paymentId': instance.paymentId,
      'createdAt': instance.createdAt,
      'trackings': instance.trackings.map((e) => e.toJson()).toList(),
      'updatedAt': instance.updatedAt,
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'paymentMethod': _$ProductPaymentMethodEnumMap[instance.paymentMethod]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ordered: 'ordered',
  OrderStatus.inProcess: 'inProcess',
  OrderStatus.inTransit: 'inTransit',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

const _$ProductPaymentMethodEnumMap = {
  ProductPaymentMethod.cod: 'cod',
  ProductPaymentMethod.stripe: 'stripe',
};
