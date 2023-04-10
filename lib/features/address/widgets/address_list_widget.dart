import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          success: (addresses) => addresses.isEmpty
              ? const NoDataWidget(title: 'No Addresses added yet.')
              : ListView.separated(
                  itemBuilder: ((context, index) => Text(
                        addresses[index].address,
                      )),
                  separatorBuilder: ((context, index) => VerticalSpacer.xxl),
                  itemCount: addresses.length),
          error: (error) => GenericErrorWidget(error: error),
        );
  }
}
