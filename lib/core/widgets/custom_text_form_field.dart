import 'package:ar_furniture_app/core/constants/widget_constants.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomTextFormField extends ConsumerStatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.errorText,
    this.prefixIconData,
    required this.hintText,
    this.isFromDeletePage = false,
    this.onTextChanged,
  }) : super(key: key);

  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? errorText;
  final IconData? prefixIconData;
  final String hintText;
  final bool isFromDeletePage;
  final Function(String)? onTextChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends ConsumerState<CustomTextFormField> {
  bool _obsecureText = true;
  String? _errorText;
  Color helperTextColor = Colors.grey.shade500;

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
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return _errorText;
        }
        return null;
      },
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      maxLines: widget.isFromDeletePage ? 8 : 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      maxLength: widget.keyboardType == TextInputType.number ? 10 : null,
      obscureText:
          widget.keyboardType == TextInputType.visiblePassword && _obsecureText,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1,
      ),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      onChanged: (value) {
        widget.onTextChanged?.call(value);
      },
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
          helperMaxLines: 1,
          helperStyle: TextStyle(
            fontSize: 10.0,
            color: helperTextColor,
          ),
          isDense: true,
          prefixIcon: widget.isFromDeletePage
              ? null
              : Icon(
                  widget.prefixIconData,
                  size: IconSize.size22,
                ),
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? _showSuffixIcon(
                  widget.keyboardType == TextInputType.visiblePassword)
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: const BorderSide(
              color: LightColor.accentColor,
            ),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: const BorderSide(
              color: Color(0xfff7f7f7),
            ),
          ),
          errorStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.red,
              ),
          errorText: _errorText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 12.0,
          )),
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
