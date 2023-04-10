import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

final addressTypes = ['Home', 'Other'];

class AddressTypeWidget extends StatefulWidget {
  const AddressTypeWidget({super.key});

  @override
  State<AddressTypeWidget> createState() => _AddressTypeWidgetState();
}

class _AddressTypeWidgetState extends State<AddressTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacer.l,
          Text(
            'Address Label',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          VerticalSpacer.m,
          Row(
            children: [
              ...addressTypes
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(
                        right: 12,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        e,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
          VerticalSpacer.l,
        ],
      ),
    );
  }
}
