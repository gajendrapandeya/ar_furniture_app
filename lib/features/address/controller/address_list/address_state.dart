import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.loading() = AddressStateLoading;
  const factory AddressState.success({required List<Address> addressList}) =
      AddressStateSuccess;
  const factory AddressState.error({required String error}) = AddressStateError;
}
