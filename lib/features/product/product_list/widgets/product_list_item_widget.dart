import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/add_to_wishlist_button.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_controller.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductListItem extends ConsumerStatefulWidget {
  const ProductListItem({
    super.key,
    required this.product,
    this.isFromWishlist = false,
  });

  final Product product;
  final bool isFromWishlist;

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
            .read(wishListProvider(widget.product.id).notifier)
            .isInWishList(userId: userId, productId: widget.product.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<WishListState>(
      wishListProvider(widget.product.id),
      (prevState, currentState) {
        if (currentState is WishListStateRemoveFromWishList) {
          ref
              .read(wishListProvider(widget.product.id).notifier)
              .removeProductFromWishList(
                  userId: ref.read(userNotifierProvider)!.uid,
                  productId: widget.product.id);
          context.showSuccessSnackBar(
            message: 'Successfully removed from wishlist',
          );
        }
      },
    );
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
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
              if (widget.isFromWishlist)
                Positioned(
                  right: 8,
                  top: 8,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => _removeItemFromWishlist(widget.product.id),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const Icon(
                        MdiIcons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            ],
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
            product.name,
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

  void _removeItemFromWishlist(String productId) {
    ref.read(wishListProvider(productId).notifier).removeProductFromWishList(
        userId: ref.read(userNotifierProvider)!.uid, productId: productId);
  }
}
