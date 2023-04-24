import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_remove_address_state.freezed.dart';

@freezed
class AddRemoveAddressState with _$AddRemoveAddressState {
  const factory AddRemoveAddressState.initial() = AddRemoveAddressStateInitial;
  const factory AddRemoveAddressState.loading() = AddRemoveAddressStateLoading;
  const factory AddRemoveAddressState.editAddressStateInitial(
      {required Address address}) = EditAddressStateInitial;
  const factory AddRemoveAddressState.editAddressSuccess() = EditAddressSuccess;
  const factory AddRemoveAddressState.addAddressSuccess() =
      AddRemoveAddressStateAddSuccess;
  const factory AddRemoveAddressState.removeAddressSuccess() =
      AddRemoveAddressStateInitialRemoveSuccess;
  const factory AddRemoveAddressState.error({required String error}) =
      AddAddressStateError;
}
