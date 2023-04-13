import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_remove_address_state.freezed.dart';

@freezed
class AddRemoveAddressState with _$AddRemoveAddressState {
  const factory AddRemoveAddressState.initial() = AddRemoveAddressStateInitial;
  const factory AddRemoveAddressState.loading() = AddRemoveAddressStateLoading;
  const factory AddRemoveAddressState.addAddressSuccess() =
      AddRemoveAddressStateInitialAddAddressSuccess;
  const factory AddRemoveAddressState.removeAddressSuccess() =
      AddRemoveAddressStateInitialRemoveAddressSuccess;
  const factory AddRemoveAddressState.error({required String error}) =
      AddAddressStateError;
}
