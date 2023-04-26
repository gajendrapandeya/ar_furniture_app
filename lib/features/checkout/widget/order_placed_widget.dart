import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderPlacedWidget extends ConsumerWidget {
  const OrderPlacedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalSpacer.exl,
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
            child: const ImageWidget(
              url: AssetConstants.orderComplete,
              isSvg: true,
              imageWidth: 400,
              imageHeight: 300,
              imageFit: BoxFit.fill,
            ),
          ),
          VerticalSpacer.exl,
          Text(
            'Order Successfully placed',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          VerticalSpacer.s,
          Text(
            'Congratulations. Your order has been placed.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          CustomOutlinedButton(
            onBtnPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteConstants.homeRoute,
                (value) => true,
              );
            },
            buttonText: 'Continue Shopping',
            textSize: 12,
            borderColor: LightColor.platianGreen,
          ),
          VerticalSpacer.exl,
        ],
      ),
    );
  }
}
