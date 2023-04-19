import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.onButtonPressed,
  });

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: LightColor.platianGreen,
                width: 1,
              ),
            ),
          ),
      onPressed: () => onButtonPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            MdiIcons.plusCircleOutline,
            color: LightColor.platianGreen,
          ),
          HorizontalSpacer.xs,
          Text(
            'Add New Address',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: LightColor.platianGreen),
          )
        ],
      ),
    );
  }
}
