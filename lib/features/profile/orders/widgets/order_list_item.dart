import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/track_order/model/order_tracking.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.order,
  });

  final ProductOrder order;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) =>
                  _buildProductItem(order.product[index], context)),
              separatorBuilder: ((context, index) => Divider(
                    color: Colors.grey.shade400,
                  )),
              itemCount: order.product.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (order.orderStatus == OrderStatus.ordered ||
                    order.orderStatus == OrderStatus.inProcess)
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: CustomOutlinedButton(
                        buttonTextColor: LightColor.platianGreen,
                        onBtnPressed: () {
                          Navigator.of(context).pushNamed(
                            RouteConstants.trackOrderScreenRoute,
                            arguments: order.copyWith(
                              trackings: [
                                OrderTracking(
                                  orderStatus: OrderStatus.ordered,
                                  updatedAt: order.updatedAt.subtract(
                                    const Duration(days: 2),
                                  ),
                                ),
                                OrderTracking(
                                  orderStatus: OrderStatus.inProcess,
                                  updatedAt: order.updatedAt.subtract(
                                    const Duration(days: 1),
                                  ),
                                ),
                                OrderTracking(
                                  orderStatus: OrderStatus.inTransit,
                                  updatedAt: order.updatedAt.subtract(
                                    const Duration(hours: 16),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        buttonText: 'Track Order',
                        textSize: 14,
                        borderColor: LightColor.platianGreen,
                      ),
                    ),
                  ),
                HorizontalSpacer.l,
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: CustomOutlinedButton(
                      buttonTextColor: LightColor.platianGreen,
                      onBtnPressed: () {
                        Navigator.of(context).pushNamed(
                          RouteConstants.orderDetailScreenRoute,
                          arguments: order,
                        );
                      },
                      buttonText: 'Order Details',
                      textSize: 14,
                      borderColor: LightColor.platianGreen,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(Cart product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  product.productDescription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontSize: 10,
                      ),
                ),
                VerticalSpacer.xs,
                Text(
                  product.formattedPrice,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          HorizontalSpacer.s,
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: 140,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            placeholder: (context, url) => const LoadingWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
