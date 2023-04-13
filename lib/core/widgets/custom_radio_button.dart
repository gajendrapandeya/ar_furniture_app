// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final bool value;
  final Color fillColor;
  final Color? checkColor;

  const CustomRadioButton({
    Key? key,
    required this.value,
    required this.fillColor,
    this.checkColor,
    ValueChanged<bool>? onChanged,
  })  : _onChanged = onChanged,
        super(key: key);

  final ValueChanged<bool>? _onChanged;

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late ValueNotifier<bool> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<bool>(widget.value);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _valueNotifier.value = !_valueNotifier.value;
        widget._onChanged?.call(_valueNotifier.value);
      },
      child: Container(
        width: 16,
        height: 16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          color: _valueNotifier.value ? widget.fillColor : Colors.transparent,
        ),
        child: _valueNotifier.value
            ? Icon(
                Icons.check,
                color: widget.checkColor ?? Colors.white,
                size: 12,
              )
            : null,
      ),
    );
  }
}
