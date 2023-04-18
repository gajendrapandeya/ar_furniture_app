import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillingAddressSwitch extends StatefulWidget {
  const BillingAddressSwitch({
    super.key,
    required this.onDefaultBillingSelected,
  });

  final Function(bool) onDefaultBillingSelected;

  @override
  State<BillingAddressSwitch> createState() => _BillingAddressSwitchState();
}

class _BillingAddressSwitchState extends State<BillingAddressSwitch> {
  bool _value = true;

  void _handleSwitch(bool newValue) {
    widget.onDefaultBillingSelected(newValue);
    setState(() {
      _value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Default Billing Address',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        CupertinoSwitch(
          activeColor: LightColor.platianGreen,
          thumbColor: Colors.white,
          trackColor: Colors.black12,
          value: _value,
          onChanged: _handleSwitch,
        ),
      ],
    );
  }
}
