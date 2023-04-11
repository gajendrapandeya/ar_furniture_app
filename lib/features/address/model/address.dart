import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required final String userId,
    required final String fullName,
    required final String mobileNumber,
    required final String address,
    required final String state,
    final String? landmark,
    required String addressType,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
