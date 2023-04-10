// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      mobileNumber: json['mobileNumber'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      landmark: json['landmark'] as String?,
      addressType: json['addressType'] as String,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'state': instance.state,
      'landmark': instance.landmark,
      'addressType': instance.addressType,
    };
