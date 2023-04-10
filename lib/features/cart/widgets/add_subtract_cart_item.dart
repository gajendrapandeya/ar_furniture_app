import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

class AddSubtractCartItem extends StatefulWidget {
  const AddSubtractCartItem({
    super.key,
    required this.onAddPressed,
    required this.onSubtractPressed,
  });

  final VoidCallback onSubtractPressed;
  final VoidCallback onAddPressed;

  @override
  State<AddSubtractCartItem> createState() => _AddSubtractCartItemState();
}

class _AddSubtractCartItemState extends State<AddSubtractCartItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            if (count > 0) {
              setState(() {
                count--;
              });
              widget.onSubtractPressed();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(
              4,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: LightColor.platianGreen,
              ),
            ),
            child: Text(
              '-',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: LightColor.platianGreen,
                  ),
            ),
          ),
        ),
        HorizontalSpacer.s,
        SizedBox(
          width: 8,
          child: Text(
            count.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        HorizontalSpacer.s,
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            if (count < 9) {
              setState(() {
                count++;
              });
              widget.onAddPressed();
            } else {
              context.showErrorSnackBar(
                message: 'You cannot add more than 10 item count',
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(
              4,
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: LightColor.platianGreen,
            ),
            child: Text(
              '+',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
