// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      mobileNumber: json['mobileNumber'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      landmark: json['landmark'] as String,
      addressType: json['addressType'] as String,
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'state': instance.state,
      'landmark': instance.landmark,
      'addressType': instance.addressType,
      'isSelected': instance.isSelected,
    };
