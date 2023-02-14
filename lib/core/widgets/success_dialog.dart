import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

enum _SuccessDialogType {
  normal,
  changePasswordScreen,
}

/// Widget that displays a [Dialog]
/// Used in [ChangePasswordPage, DeleteAccountPage, ForgotPasswordPage]
class SuccessDialog extends ConsumerWidget {
  const SuccessDialog({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.onBtnPressed,
  })  : _successDialogType = _SuccessDialogType.normal,
        super(key: key);

  const SuccessDialog.fromChangePasswordScreen({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.onBtnPressed,
  })  : _successDialogType = _SuccessDialogType.changePasswordScreen,
        super(key: key);

  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback onBtnPressed;
  final _SuccessDialogType _successDialogType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (_successDialogType) {
      case _SuccessDialogType.normal:
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpacer.l,
                SvgPicture.asset(
                  AssetConstants.success,
                  height: 72.0,
                  width: 72.0,
                ),
                VerticalSpacer.xs,
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.5,
                ),
                VerticalSpacer.l,
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                VerticalSpacer.s,
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    subTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                VerticalSpacer.exl,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomElevatedButton(
                    onButtonPressed: () {
                      onBtnPressed();
                    },
                    buttonText: buttonText,
                  ),
                ),
              ],
            ),
          ),
        );

      case _SuccessDialogType.changePasswordScreen:
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpacer.l,
                SvgPicture.asset(
                  AssetConstants.success,
                  height: 72.0,
                  width: 72.0,
                ),
                VerticalSpacer.xs,
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.5,
                ),
                VerticalSpacer.l,
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                VerticalSpacer.s,
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    subTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                VerticalSpacer.xl,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomElevatedButton(
                    onButtonPressed: () {
                      onBtnPressed();
                    },
                    buttonText: buttonText,
                  ),
                ),
                VerticalSpacer.xl,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomOutlinedButton(
                    onBtnPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteConstants.loginRoute,
                        (Route<dynamic> route) => false,
                      );
                    },
                    buttonText: 'Log Out',
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
