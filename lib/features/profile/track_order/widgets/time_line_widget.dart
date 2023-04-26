import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/profile/track_order/model/order_tracking.dart';
import 'package:flutter/material.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    super.key,
    required this.trackings,
  });

  final List<OrderTracking> trackings;

  @override
  Widget build(BuildContext context) {
    debugPrint('widgetTrackings: ${trackings.length}');
    return ListView.builder(
      itemCount: trackings.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        final tracking = trackings[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 2,
                  height: 20,
                  color: index == 0 ? Colors.white : LightColor.platianGreen,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: LightColor.platianGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    tracking.getIconDataBasedOnOrderStatus(),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: index == trackings.length - 1
                      ? Colors.white
                      : LightColor.platianGreen,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      tracking.getTitleBasedOnOrderStatus(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VerticalSpacer.s,
                    Text(
                      tracking.formattedUpdatedAt,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
