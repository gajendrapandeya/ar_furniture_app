import 'package:ar_furniture_app/core/widgets/custom_text_form_field.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

class LabelledTextFormField extends StatelessWidget {
  const LabelledTextFormField(
      {super.key,
      required this.label,
      this.value,
      this.readOnly = false,
      this.onTextChanged,
      this.errorText,
      this.keyboardType = TextInputType.text});

  final String label;
  final String? value;
  final bool readOnly;
  final Function(String)? onTextChanged;
  final String? errorText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey.shade400,
              ),
        ),
        VerticalSpacer.xs,
        CustomTextFormField(
          readOnly: readOnly,
          formFieldValue: value,
          onTextChanged: onTextChanged,
          errorText: errorText,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
