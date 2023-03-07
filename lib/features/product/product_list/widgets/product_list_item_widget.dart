import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/add_to_wishlist_button.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductListItem extends ConsumerStatefulWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductListItemState();
}

class _ProductListItemState extends ConsumerState<ProductListItem> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final userId = ref.read(userNotifierProvider)?.uid;
      if (userId != null) {
        ref
            .read(wishListProvider.notifier)
            .isInWishList(userId: userId, productId: widget.product.id ?? "");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: ImageWidget(
              url: widget.product.imageUrls.first,
              imageFit: BoxFit.cover,
            ),
          ),
        ),
        _buildProductInfo()
      ],
    );
  }

  Widget _buildProductInfo() {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 12,
      ),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          VerticalSpacer.xs,
          _buildProductNameAndFavouriteWidget(widget.product, context),
          VerticalSpacer.s,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.product.formattedPrice,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (widget.product.isRatingAvailable)
                _buildRatingWidget(widget.product.rating, context),
            ],
          ),
          VerticalSpacer.l,
        ],
      ),
    );
  }

  Row _buildProductNameAndFavouriteWidget(
      Product product, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name ?? 'Unknown',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary.withOpacity(
                        0.7,
                      ),
                ),
          ),
        ),
        AddToWishlistButton(product: product),
      ],
    );
  }

  Widget _buildRatingWidget(double rating, BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        HorizontalSpacer.xs,
        const Icon(
          MdiIcons.star,
          color: Colors.amber,
          size: 18,
        )
      ],
    );
  }
}
