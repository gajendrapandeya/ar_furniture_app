import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/cart/widgets/add_subtract_cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.cart,
    required this.onAddPressed,
    required this.onMinusPressed,
    required this.onDeletePressed,
  });

  final Function(int) onAddPressed;
  final Function(int) onMinusPressed;
  final VoidCallback onDeletePressed;

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          child: CachedNetworkImage(
            width: 150,
            height: 100,
            fit: BoxFit.fill,
            imageUrl: cart.imageUrl,
          ),
        ),
        HorizontalSpacer.xl,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VerticalSpacer.s,
              Text(
                cart.formattedPrice,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              VerticalSpacer.s,
              Row(
                children: [
                  AddSubtractCartItem(
                    onAddPressed: (count) => onAddPressed(count),
                    onSubtractPressed: (count) => onMinusPressed(count),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      MdiIcons.trashCanOutline,
                      color: Colors.black54,
                      size: 20,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
