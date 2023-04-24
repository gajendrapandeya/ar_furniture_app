import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomOutlinedButton extends ConsumerWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onBtnPressed,
    required this.buttonText,
    this.isWideBorder = false,
    this.isLoading = false,
    this.isFilled = false,
    this.textSize = 14.0,
    this.borderColor,
  }) : super(key: key);
  final Function onBtnPressed;
  final String buttonText;
  final double textSize;
  final bool isWideBorder;
  final bool isLoading;
  final bool isFilled;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50.0),
            ),
            backgroundColor: isFilled
                ? MaterialStateProperty.all(
                    const Color(0xff346751),
                  )
                : MaterialStateProperty.all(Colors.transparent),
            side: MaterialStateProperty.all(
              BorderSide(
                color: borderColor ?? Colors.grey.shade400,
                width: isWideBorder ? 2.0 : 1.0,
              ),
            ),
          ),
      onPressed: () {
        onBtnPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: textSize,
                  color: isFilled
                      ? Colors.white
                      : Theme.of(context).colorScheme.secondary,
                ),
          ),
          HorizontalSpacer.xs,
          if (isLoading)
            SizedBox(
              height: 12.0,
              width: 12.0,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                strokeWidth: 2.0,
              ),
            )
        ],
      ),
    );
  }
}
