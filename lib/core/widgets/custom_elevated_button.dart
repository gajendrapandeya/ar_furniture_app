import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomElevatedButton extends ConsumerWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onButtonPressed,
    this.isLoading = false,
    required this.buttonText,
  }) : super(key: key);
  final Function onButtonPressed;
  final bool isLoading;
  final String buttonText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(
                double.infinity,
                50.0,
              ),
            ),
          ),
      onPressed: () {
        onButtonPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
          ),
          HorizontalSpacer.l,
          if (isLoading)
            SizedBox(
              height: 20.0,
              width: 20.0,
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
