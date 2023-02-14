import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget that displays social media buttons like Google or Apple login button
/// Used in Signup / Login Page
class SocialMediaButton extends ConsumerWidget {
  const SocialMediaButton({
    required this.onBtnPressed,
    required this.buttonText,
    required this.iconData,
    required this.iconColor,
    Key? key,
  }) : super(key: key);
  final Function onBtnPressed;
  final String buttonText;
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50.0),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
      onPressed: () {
        onBtnPressed();
      },
      icon: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
      label: Text(
        buttonText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
