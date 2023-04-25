import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:easy_stepper/easy_stepper.dart';
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
          const Align(
            alignment: Alignment.center,
            child: ImageWidget(
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
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onBtnPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      RouteConstants.productListRoute,
                    );
                  },
                  buttonText: 'Continue Shopping',
                  textSize: 12,
                  borderColor: LightColor.platianGreen,
                ),
              ),
              HorizontalSpacer.l,
              Expanded(
                child: CustomElevatedButton(
                  onButtonPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      RouteConstants.trackOrderScreenRoute,
                    );
                  },
                  buttonText: 'Track Order',
                ),
              )
            ],
          ),
          VerticalSpacer.exl,
        ],
      ),
    );
  }
}
