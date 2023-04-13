import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required final String id,
    required final String fullName,
    required final String mobileNumber,
    required final String address,
    required final String state,
    required final String landmark,
    required final String addressType,
    bool? isSelected,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
