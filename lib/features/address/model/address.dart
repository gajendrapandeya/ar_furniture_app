import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

enum AddressType {
  home,
  other,
}

@freezed
class Address with _$Address {
  const factory Address({
    required final String userId,
    required final String name,
    required final String mobileNumber,
    required final int postalCode,
    required final String streetAddress,
    required final String city,
    required String country,
    required AddressType addressType,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
