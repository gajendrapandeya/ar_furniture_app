import 'package:ar_furniture_app/core/constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomTextFormField extends ConsumerStatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.errorText,
    required this.hintText,
    this.onTextChanged,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String? errorText;
  final String hintText;
  final Function(String)? onTextChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends ConsumerState<CustomTextFormField> {
  bool _obsecureText = true;
  String? _errorText;
  Color helperTextColor = Colors.grey.shade500;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _errorText = widget.errorText;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.errorText != widget.errorText) {
      setState(() {
        _errorText = widget.errorText;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return _errorText;
        }
        return null;
      },
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
      textInputAction: TextInputAction.next,
      maxLength: widget.keyboardType == TextInputType.number ? 10 : null,
      obscureText:
          widget.keyboardType == TextInputType.visiblePassword && _obsecureText,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1,
      ),
      onChanged: (value) {
        widget.onTextChanged?.call(value);
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperMaxLines: 1,
        suffixIcon: widget.keyboardType == TextInputType.visiblePassword
            ? _showSuffixIcon(
                widget.keyboardType == TextInputType.visiblePassword)
            : null,
        filled: true,
        fillColor: Colors.grey.shade50,
        errorText: _errorText,
      ),
    );
  }

  Widget _showSuffixIcon(bool isPasswordField) {
    if (_obsecureText && isPasswordField) {
      return InkWell(
        onTap: _togglePassword,
        child: const Icon(
          MdiIcons.eyeOff,
          size: IconSize.size18,
          color: Colors.black45,
        ),
      );
    } else {
      return InkWell(
        onTap: _togglePassword,
        child: const Icon(
          MdiIcons.eyeOutline,
          size: IconSize.size18,
          color: Colors.black45,
        ),
      );
    }
  }

  void _togglePassword() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
