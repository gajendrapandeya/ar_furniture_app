// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/widgets/billing_address_switch.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

final addressTypes = ['Home', 'Other'];

class AddressTypeWidget extends StatefulWidget {
  const AddressTypeWidget({
    super.key,
    required this.onAddressTypeSelected,
    required this.isDefaultBillingSelected,
  });

  final Function(String) onAddressTypeSelected;
  final Function(bool) isDefaultBillingSelected;

  @override
  State<AddressTypeWidget> createState() => _AddressTypeWidgetState();
}

class _AddressTypeWidgetState extends State<AddressTypeWidget> {
  int _selectedIndex = -1;
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
              ...addressTypes.mapIndexed(
                (index, title) {
                  bool isSelected = index == _selectedIndex;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      widget.onAddressTypeSelected(title);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 12,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? LightColor.platianGreen
                              : Colors.grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color:
                                  isSelected ? LightColor.platianGreen : null,
                            ),
                      ),
                    ),
                  );
                },
              ).toList()
            ],
          ),
          VerticalSpacer.l,
          Divider(
            color: Colors.grey.shade200,
          ),
          BillingAddressSwitch(
            onDefaultBillingSelected: (value) =>
                widget.isDefaultBillingSelected(value),
          ),
        ],
      ),
    );
  }
}
