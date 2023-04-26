// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      id: json['id'] as String,
      quantity: json['quantity'] as int,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
      productDescription: json['productDescription'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'productDescription': instance.productDescription,
      'name': instance.name,
    };
