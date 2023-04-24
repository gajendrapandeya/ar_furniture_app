import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/controller/address_list/address_controller.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:ar_furniture_app/features/checkout/widget/add_address_button.dart';
import 'package:ar_furniture_app/features/checkout/widget/address_item.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressWidget extends ConsumerStatefulWidget {
  const AddressWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends ConsumerState<AddressWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final userId = ref.read(userNotifierProvider)!.uid;
      ref.read(addressProvider.notifier).fetchAddresses(
            userId: userId,
            addressType: '',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Delivery Address',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
        ),
        VerticalSpacer.l,
        AddAddressButton(
          onButtonPressed: () async {
            final result = await Navigator.of(context).pushNamed(
              RouteConstants.addAddressScreenRoute,
              arguments: true,
            );
            if (result != null && result == true) {
              ref.read(addressProvider.notifier).fetchAddresses(
                  userId: ref.read(userNotifierProvider)!.uid, addressType: '');
            }
          },
        ),
        VerticalSpacer.l,
        ref.watch(addressProvider).when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (addresses) => _buildAddressList(addresses),
              error: (error) => GenericErrorWidget(error: error),
            )
      ],
    );
  }

  Widget _buildAddressList(List<Address> addresses) {
    if (addresses.isEmpty) {
      return const NoDataWidget(title: 'No Addresses added yet.');
    }
    return Expanded(
      child: ListView.separated(
        itemCount: addresses.length,
        itemBuilder: ((context, index) => AddressItem(
              address: addresses[index],
              index: index,
            )),
        separatorBuilder: ((context, index) => VerticalSpacer.l),
      ),
    );
  }
}
