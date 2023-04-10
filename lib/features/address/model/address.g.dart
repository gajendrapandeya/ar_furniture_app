// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      userId: json['userId'] as String,
      name: json['name'] as String,
      mobileNumber: json['mobileNumber'] as String,
      postalCode: json['postalCode'] as int,
      streetAddress: json['streetAddress'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      addressType: $enumDecode(_$AddressTypeEnumMap, json['addressType']),
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'postalCode': instance.postalCode,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'country': instance.country,
      'addressType': _$AddressTypeEnumMap[instance.addressType]!,
    };

const _$AddressTypeEnumMap = {
  AddressType.home: 'home',
  AddressType.other: 'other',
};
