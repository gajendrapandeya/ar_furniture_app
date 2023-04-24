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
            return addresses.isEmpty
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
    ///TODO: Handle Edit Address
    return Material(
      shadowColor: Colors.grey.shade100,
      color: Colors.white,
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color:
              address.isSelected ? LightColor.platianGreen : Colors.transparent,
          width: 0.8,
        )),
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
                ),
                const Spacer(),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text('Edit'),
                // )
                if (address.isSelected)
                  CustomRadioButton(
                    value: address.isSelected,
                    fillColor: LightColor.platianGreen,
                  )
              ],
            ),
            VerticalSpacer.xl,
            Text(
              address.fullName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VerticalSpacer.s,
            Text(
              address.mobileNumber,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VerticalSpacer.l,
            Text(
              '${address.landmark}, ${address.address}, ${address.state}',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }

  onItemTapped(String id) {}
}
