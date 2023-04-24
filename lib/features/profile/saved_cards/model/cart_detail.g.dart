// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardDetail _$$_CardDetailFromJson(Map<String, dynamic> json) =>
    _$_CardDetail(
      cardNumber: json['cardNumber'] as String,
      id: json['id'] as String,
      cvv: json['cvv'] as String,
      expiryDate: json['expiryDate'] as String,
      zipCode: json['zipCode'] as String,
    );

Map<String, dynamic> _$$_CardDetailToJson(_$_CardDetail instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'id': instance.id,
      'cvv': instance.cvv,
      'expiryDate': instance.expiryDate,
      'zipCode': instance.zipCode,
    };
