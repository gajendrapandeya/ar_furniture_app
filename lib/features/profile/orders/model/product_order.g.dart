// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      orderId: json['orderId'] as String,
      userId: json['userId'] as String,
      product: (json['product'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['totalAmount'] as int,
      userAddress:
          Address.fromJson(json['userAddress'] as Map<String, dynamic>),
      paymentId: json['paymentId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      paymentMethod:
          $enumDecode(_$ProductPaymentMethodEnumMap, json['paymentMethod']),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'userId': instance.userId,
      'product': instance.product,
      'totalAmount': instance.totalAmount,
      'userAddress': instance.userAddress,
      'paymentId': instance.paymentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'paymentMethod': _$ProductPaymentMethodEnumMap[instance.paymentMethod]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ordered: 'ordered',
  OrderStatus.inProcess: 'inProcess',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

const _$ProductPaymentMethodEnumMap = {
  ProductPaymentMethod.cod: 'cod',
  ProductPaymentMethod.stripe: 'stripe',
};
