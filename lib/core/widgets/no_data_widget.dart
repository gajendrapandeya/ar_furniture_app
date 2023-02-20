import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget(
      {Key? key,
      required this.title,
      this.subTitle,
      this.showActionButton = false})
      : super(key: key);
  final String title;
  final String? subTitle;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Center(
          child: SvgPicture.asset(AssetConstants.notFound),
        ),
        VerticalSpacer.exl,
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        VerticalSpacer.l,
        if (showActionButton)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: CustomElevatedButton(
              onButtonPressed: () {
                Navigator.of(context).pop();
              },
              buttonText: 'Go Back',
            ),
          )
      ],
    );
  }
}
