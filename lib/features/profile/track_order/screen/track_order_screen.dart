import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/utils/date_time_utils.dart';
import 'package:ar_furniture_app/core/utils/string_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_app_bar.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/orders/widgets/delivery_address_widget.dart';
import 'package:ar_furniture_app/features/profile/track_order/widgets/order_progress_widget.dart';
import 'package:ar_furniture_app/features/profile/track_order/widgets/time_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrderScreen extends ConsumerWidget {
  const TrackOrderScreen({
    super.key,
    required this.order,
  });

  final ProductOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Track Orders',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const ImageWidget(
                  url: AssetConstants.trackOrder,
                  isSvg: true,
                ),
              ),
              VerticalSpacer.xl,
              _buildOrderIdWidget(context),
              VerticalSpacer.xxxl,
              Text(
                order.orderStatus.name.toTitleCase(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              VerticalSpacer.xs,
              Text(
                'Last Updated: ${order.updatedAt.timeAgo()}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey.shade500,
                    ),
              ),
              VerticalSpacer.xxxl,
              SizedBox(
                height: 6,
                child: OrderProgressWidget(orderStatus: order.orderStatus),
              ),
              VerticalSpacer.xxl,
              Material(
                elevation: 2,
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DeliveryAddressWidget(userAddress: order.userAddress),
                ),
              ),
              VerticalSpacer.xxl,
              TimelineWidget(
                trackings: order.trackings,
              )
            ],
          ),
        ),
      ),
    );
  }

  Material _buildOrderIdWidget(BuildContext context) {
    return Material(
      color: Colors.grey.shade50,
      elevation: 2,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: 'Order ID ',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: order.formattedOrderId,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: LightColor.platianGreen,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
