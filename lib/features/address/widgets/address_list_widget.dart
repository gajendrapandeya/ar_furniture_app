import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_radio_button.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/controller/address_list/address_controller.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressListWidget extends ConsumerStatefulWidget {
  const AddressListWidget({
    super.key,
    required this.selectedTabName,
  });

  final String selectedTabName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddressListWidgetState();
}

class _AddressListWidgetState extends ConsumerState<AddressListWidget> {
  final List<Address> _addresses = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(addressProvider.notifier).fetchAddresses(
            userId: ref.read(userNotifierProvider)!.uid,
            addressType: widget.selectedTabName,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(addressProvider).when(
          loading: () => const LoadingWidget(),
          success: (addresses) {
            _addresses
              ..clear()
              ..addAll(addresses);
            return _addresses.isEmpty
                ? const NoDataWidget(title: 'No Addresses added yet.')
                : Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.only(top: 24),
                        itemBuilder: ((context, index) =>
                            _buildAddressListItem(addresses[index])),
                        separatorBuilder: ((context, index) =>
                            VerticalSpacer.xxl),
                        itemCount: addresses.length),
                  );
          },
          error: (error) => GenericErrorWidget(error: error),
        );
  }

  Widget _buildAddressListItem(Address address) {
    return InkWell(
      onTap: () => onItemTapped(address.id),
      child: Material(
        shadowColor: Colors.grey.shade100,
        color: Colors.white,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    address.addressType == 'Home'
                        ? MdiIcons.home
                        : MdiIcons.officeBuildingMarkerOutline,
                    color: LightColor.platianGreen,
                  ),
                  HorizontalSpacer.s,
                  Text(
                    address.addressType == 'Home' ? 'Home' : 'Other',
                  )
                ],
              ),
              VerticalSpacer.xl,
              Text(
                address.fullName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VerticalSpacer.s,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address.mobileNumber,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const CustomRadioButton(
                    value: true,
                    fillColor: LightColor.platianGreen,
                  )
                ],
              ),
              VerticalSpacer.l,
              Text(
                '${address.landmark}, ${address.address}, ${address.state}',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectAddress(String addressId) {
    // _addresses
    //     .map((address) =>
    //         address.id == addressId ? (address..isSelected = true) : address)
    //     .toList();
  }

  onItemTapped(String id) {}
}
