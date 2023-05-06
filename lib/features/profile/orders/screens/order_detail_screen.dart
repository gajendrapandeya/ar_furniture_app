// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_app_bar.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/custom_rating_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/orders/widgets/delivery_address_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    super.key,
    required this.order,
  });

  final ProductOrder order;

  @override
  Widget build(BuildContext context) {
    ///TODO: Buy Product directly
    ///TODO: Show Stripe Payment only after clicking continue
    return Scaffold(
      appBar: const CustomAppbar(title: 'Order Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...order.products
                  .mapIndexed(
                    (index, product) => Column(
                      children: [
                        _buildProductItem(product, context),
                        if (order.products.length > 1 &&
                            index != order.products.length - 1) ...[
                          VerticalSpacer.s,
                          Divider(
                            color: Colors.grey.shade400,
                          ),
                          VerticalSpacer.l,
                        ]
                      ],
                    ),
                  )
                  .toList(),
              VerticalSpacer.xl,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomOutlinedButton(
                  borderColor: LightColor.platianGreen,
                  onBtnPressed: () {
                    Navigator.of(context).pushNamed(
                      RouteConstants.trackOrderScreenRoute,
                      arguments: order,
                    );
                  },
                  buttonText: 'Track Order',
                ),
              ),
              VerticalSpacer.l,
              _buildRatingWidget(context),
              DeliveryAddressWidget(userAddress: order.userAddress),
              VerticalSpacer.l,
              Divider(
                color: Colors.grey.shade400,
              ),
              _buildTotalPriceWidget(context),
              VerticalSpacer.l,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(Cart product, BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: product.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.12,
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
        VerticalSpacer.m,
        Text(
          product.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        VerticalSpacer.s,
        Text(
          product.productDescription,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
        ),
      ],
    );
  }

  Widget _buildRatingWidget(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade400,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            children: [
              Text(
                'Rate Product',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              HorizontalSpacer.l,
              const Expanded(
                child: CustomRatingWidget(
                  initialRating: 4,
                ),
              ),
              HorizontalSpacer.l,
              const Icon(
                MdiIcons.chevronRight,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade400,
        )
      ],
    );
  }

  Widget _buildTotalPriceWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Row(
            children: [
              Text(
                'Total Order Price',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Text(
                'Rs. ${order.totalAmount}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade400,
        )
      ],
    );
  }
}
