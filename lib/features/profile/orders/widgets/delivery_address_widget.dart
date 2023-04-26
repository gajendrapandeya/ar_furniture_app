import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:flutter/material.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({
    super.key,
    required this.userAddress,
  });
  final Address userAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpacer.s,
        Text(
          'Delivery Address',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        VerticalSpacer.s,
        Text(
          userAddress.fullName,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey.shade700,
              ),
        ),
        VerticalSpacer.xxs,
        Text(
          userAddress.mobileNumber,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey.shade700,
              ),
        ),
        VerticalSpacer.xxs,
        Text(
          '${userAddress.landmark}, ${userAddress.address}, ${userAddress.state}',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey.shade700,
              ),
        ),
      ],
    );
  }
}
