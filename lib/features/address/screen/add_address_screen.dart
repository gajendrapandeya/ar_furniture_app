import 'dart:math';

import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/controller/add_address/add_remove_address_controller.dart';
import 'package:ar_furniture_app/features/address/controller/add_address/add_remove_address_state.dart';
import 'package:ar_furniture_app/features/address/controller/area_controller.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/address/widgets/address_type_widget.dart';
import 'package:ar_furniture_app/features/address/widgets/area_bottom_sheet.dart';
import 'package:ar_furniture_app/features/address/widgets/textfield_with_label_in_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final selectedAreaProvider = StateProvider<String>((ref) {
  return '';
});

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  String _fullName = '';
  String _mobileNumber = '';
  String _address = '';
  String _landmark = '';
  String _addressType = '';

  bool _isDefaultBillingSelected = true;

  @override
  Widget build(BuildContext context) {
    ref.listen<AddRemoveAddressState>(
      addRemoveAddressProvider,
      (prevState, currentState) {
        if (currentState is AddRemoveAddressStateAddSuccess) {
          context.showSuccessSnackBar(message: 'Address Added Successfully');
          Navigator.of(context).pop(true);
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            MdiIcons.chevronLeft,
            size: 28,
          ),
        ),
        title: const Text(
          'Add Billing Address',
        ),
      ),
      body: ref.watch(addRemoveAddressProvider).when(
            initial: () => _buildBody(),
            editAddressStateInitial: (address) => _buildBody(),
            editAddressSuccess: () => null,
            loading: () => const LoadingWidget(),
            addAddressSuccess: () {
              return null;
            },
            removeAddressSuccess: () {
              return null;
            },
            error: (error) => GenericErrorWidget(
              error: error,
            ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightColor.platianGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        onPressed: () {
          if (_areFieldsValid()) {
            _saveAddressToFirebase();
          } else {
            context.showErrorSnackBar(message: 'All fields are mandatory.');
          }
        },
        child: const Icon(MdiIcons.check),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            _buildFullNameAndMobileNumber(),
            VerticalSpacer.xxl,
            _buildAddress(),
            VerticalSpacer.xxl,
            AddressTypeWidget(
              onAddressTypeSelected: (selectedAddress) {
                _addressType = selectedAddress;
              },
              isDefaultBillingSelected: (value) {
                _isDefaultBillingSelected = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullNameAndMobileNumber() {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 4,
        top: 12,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          TextfieldWithLableInContainer(
            title: 'Full Name',
            hintText: 'Input full Name',
            onInputChanged: (userInput) {
              _fullName = userInput;
            },
          ),
          Divider(
            color: Colors.grey.shade200,
          ),
          TextfieldWithLableInContainer(
            title: 'Mobile Number',
            hintText: 'Input mobile number',
            onInputChanged: (userInput) {
              _mobileNumber = userInput;
            },
            textInputType: TextInputType.number,
          )
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 4,
        top: 12,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          VerticalSpacer.s,
          _buildArea(),
          VerticalSpacer.s,
          Divider(
            color: Colors.grey.shade200,
          ),
          TextfieldWithLableInContainer(
            title: 'Address',
            onInputChanged: (userInput) {
              _address = userInput;
            },
            hintText: 'House no./ building/ street / area',
          ),
          Divider(
            color: Colors.grey.shade200,
          ),
          TextfieldWithLableInContainer(
            title: 'Landmark(Optional)',
            onInputChanged: (userInput) {
              _landmark = userInput;
            },
            hintText: 'E.g. beside burger house',
          ),
        ],
      ),
    );
  }

  Widget _buildArea() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: Row(
        children: [
          Text(
            'Area',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: InkWell(
              onTap: () async {
                final result = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AreaBottomSheet(),
                );
                if (result != null && result == true) {
                  final selectedDistrictProvinceProvider =
                      ref.read(districtProvinceProvider);
                  final area =
                      '${selectedDistrictProvinceProvider.selectedProvince!.provinceName}, ${selectedDistrictProvinceProvider.selectedDistrict!.districtName}';

                  ref.read(selectedAreaProvider.notifier).update(
                        (state) => state = area,
                      );
                }
              },
              child: Text(
                ref.watch(selectedAreaProvider).isEmpty
                    ? 'Select the region, city, area >'
                    : ref.watch(selectedAreaProvider),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: ref.watch(selectedAreaProvider).isEmpty
                          ? FontWeight.w400
                          : FontWeight.bold,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _areFieldsValid() {
    if (_fullName.isEmpty) return false;
    if (_mobileNumber.isEmpty) return false;
    if (_address.isEmpty) return false;
    if (_landmark.isEmpty) return false;
    if (_addressType.isEmpty) return false;
    return true;
  }

  void _saveAddressToFirebase() {
    final area = ref.read(selectedAreaProvider);
    final address = Address(
        id: _getRandomString(10),
        isSelected: _isDefaultBillingSelected,
        fullName: _fullName,
        mobileNumber: _mobileNumber,
        address: _address,
        state: area,
        landmark: _landmark,
        addressType: _addressType);
    ref.read(addRemoveAddressProvider.notifier).addAddress(
          address: address,
          userId: ref.read(userNotifierProvider)!.uid,
        );
  }

  String _getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}
