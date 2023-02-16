import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotLoggedInWidget extends StatelessWidget {
  const NotLoggedInWidget({
    super.key,
    required this.onLoginPressed,
  });

  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Text(
            '\t\t\t\t\t\t\t\t\t\t\t\t404\nLogin Required.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          VerticalSpacer.l,
          Lottie.asset(AssetConstants.lottieLoginRequired),
          const Spacer(),
          CustomElevatedButton(
              onButtonPressed: () => onLoginPressed(), buttonText: 'Sign In'),
        ],
      ),
    );
  }
}
