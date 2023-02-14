import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.assetPath,
    required this.mainText,
    required this.subText,
  });

  final String assetPath;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        SvgPicture.asset(
          assetPath,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            mainText,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        VerticalSpacer.l,
        Text(
          subText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
      ],
    );
  }
}
