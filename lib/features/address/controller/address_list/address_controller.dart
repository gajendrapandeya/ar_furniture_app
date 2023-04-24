import 'package:ar_furniture_app/features/address/controller/address_list/address_state.dart';
import 'package:ar_furniture_app/features/address/service/address_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressProvider =
    StateNotifierProvider<AddressController, AddressState>((ref) {
  return AddressController(ref.watch(addressServiceProvider));
});

class AddressController extends StateNotifier<AddressState> {
  AddressController(this._service) : super(const AddressState.loading());

  final AddressService _service;

  Future<void> fetchAddresses(
      {required String userId, required String addressType}) async {
    try {
      state = const AddressState.loading();
      final result = await _service.fetchAddresses(
          addressType: addressType, userId: userId);
      state = AddressState.success(addressList: result);
    } catch (error) {
      state = AddressState.error(error: error.toString());
    }
  }
}
