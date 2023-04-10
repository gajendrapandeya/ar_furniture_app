import 'package:flutter/material.dart';

class TextfieldWithLableInContainer extends StatelessWidget {
  const TextfieldWithLableInContainer({
    super.key,
    required this.title,
    required this.hintText,
    this.textInputType = TextInputType.text,
  });

  final String title;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Expanded(
              child: TextFormField(
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.end,
                keyboardType: textInputType,
                decoration: InputDecoration(
                  filled: false,
                  hintText: hintText,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
