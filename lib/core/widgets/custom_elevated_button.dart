import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _CustomElevatedButtonType {
  normal,
  buttonWithIcon,
}

class CustomElevatedButton extends ConsumerWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onButtonPressed,
    this.isLoading = false,
    this.iconData,
    required this.buttonText,
  })  : _buttonType = _CustomElevatedButtonType.normal,
        super(key: key);

  const CustomElevatedButton.withIcon({
    Key? key,
    required this.onButtonPressed,
    this.isLoading = false,
    this.iconData,
    required this.buttonText,
  })  : _buttonType = _CustomElevatedButtonType.buttonWithIcon,
        super(key: key);

  final Function onButtonPressed;
  final bool isLoading;
  final String buttonText;
  final IconData? iconData;
  final _CustomElevatedButtonType _buttonType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (_buttonType) {
      case _CustomElevatedButtonType.normal:
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
      case _CustomElevatedButtonType.buttonWithIcon:
        return ElevatedButton.icon(
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
          icon: Icon(
            iconData,
            size: 24,
          ),
          label: Text(
            buttonText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
          ),
        );
    }
  }
}
