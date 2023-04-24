import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/checkout/controller/checkout_provider.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressItem extends ConsumerWidget {
  const AddressItem({
    super.key,
    required this.address,
    required this.index,
  });

  final Address address;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutProvider = ref.watch(checkoutNotifier);
    bool isSelected = checkoutProvider.selectedAddress == address;
    return Material(
      shadowColor: Colors.grey.shade100,
      color: Colors.white,
      elevation: 2,
      child: InkWell(
        onTap: () {
          ref
              .read(checkoutNotifier.notifier)
              .setSelectedAddress(address: address);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade50,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ],
            border: Border.all(
              width: 0.8,
              color: isSelected ? LightColor.platianGreen : Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
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
                  ),
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
      ),
    );
  }
}
