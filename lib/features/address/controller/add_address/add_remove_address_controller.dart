import 'package:ar_furniture_app/features/address/controller/add_address/add_remove_address_state.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/address/service/address_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addRemoveAddressProvider = StateNotifierProvider.autoDispose<
    AddRemoveAddressController, AddRemoveAddressState>((ref) {
  return AddRemoveAddressController(ref.watch(addressServiceProvider));
});

class AddRemoveAddressController extends StateNotifier<AddRemoveAddressState> {
  AddRemoveAddressController(this._service)
      : super(
          const AddRemoveAddressState.initial(),
        );

  final AddressService _service;

  Future<void> addAddress({
    required Address address,
    required String userId,
  }) async {
    try {
      state = const AddRemoveAddressState.loading();
      await _service.addAddress(
        address: address,
        userId: userId,
      );
      state = const AddRemoveAddressState.addAddressSuccess();
    } catch (error) {
      state = AddRemoveAddressState.error(error: error.toString());
    }
  }

  Future<void> removeAddress({required String userId}) async {
    try {
      state = const AddRemoveAddressState.loading();
      await _service.removeAddress(userId: userId);
      state = const AddRemoveAddressState.removeAddressSuccess();
    } catch (error) {
      state = AddRemoveAddressState.error(error: error.toString());
    }
  }
}
