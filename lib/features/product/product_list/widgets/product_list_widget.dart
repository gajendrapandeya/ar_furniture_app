import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_dialog.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/controller/product_controller.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_loading_widget.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_controller.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductListWidget extends ConsumerWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<WishListState>(wishListProvider, (previous, currentState) {
      if (currentState is WishListStateAddedToWishList) {
        context.showSuccessSnackBar(
            message: 'Added to wish list successfully.');
      }
    });
    debugPrint('state: ${ref.watch(productsProvider)}');
    return ref.watch(productsProvider).when(
          initial: () => SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: const ProductsLoadingWidget(),
          ),
          loading: () => SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: const ProductsLoadingWidget(),
          ),
          loaded: (products) => _buildProductList(products, context),
          error: (error) => GenericErrorWidget(error: error),
        );
  }

  Widget _buildProductList(List<Product> products, BuildContext context) {
    debugPrint('lenght: ${products.length}');
    if (products.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const Text(
            'No Products Found in this category.',
          ),
        ],
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: ((context, index) =>
          _buildProductItem(products[index], context)),
    );
  }

  Widget _buildProductItem(Product product, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: ImageWidget(
              url: product.imageUrls[1],
            ),
          ),
        ),
        VerticalSpacer.l,
        _buildProductInfo(product, context)
      ],
    );
  }

  Widget _buildProductInfo(Product product, BuildContext context) {
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
          _buildProductNameAndFavouriteWidget(product, context),
          VerticalSpacer.s,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.formattedPrice,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (product.isRatingAvailable)
                _buildRatingWidget(product.rating, context),
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
        _buildAddtoWishListButton(context, product),
      ],
    );
  }

  Widget _buildAddtoWishListButton(BuildContext context, Product product) {
    return Consumer(
      builder: (context, ref, child) {
        return LikeButton(
          size: 18,
          bubblesColor: BubblesColor(
            dotPrimaryColor: Theme.of(context).colorScheme.tertiary,
            dotSecondaryColor: Theme.of(context).colorScheme.tertiary,
          ),
          onTap: (isLiked) async {
            if (ref.read(userNotifierProvider) != null) {
              return _onLikeButtonTapped(
                  isLiked, ref, ref.read(userNotifierProvider)!.uid, product);
            } else {
              _handleNotLogggedInWishButtonClick(context);
              return false;
            }
          },
          likeBuilder: (isLiked) {
            return Icon(
              MdiIcons.heart,
              color: isLiked
                  ? Theme.of(context).colorScheme.tertiary
                  : Colors.grey,
              size: 18,
            );
          },
          circleColor: CircleColor(
            start: Theme.of(context).colorScheme.tertiary,
            end: Theme.of(context).colorScheme.tertiary,
          ),
        );
      },
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

  Future<bool> _onLikeButtonTapped(
      bool isLiked, WidgetRef ref, String userId, Product product) async {
    ref
        .read(wishListProvider.notifier)
        .addProductToWishList(userId: userId, product: product);

    return true;
  }

  void _handleNotLogggedInWishButtonClick(BuildContext context) async {
    showDialog(
      context: context,
      builder: ((context) {
        return const CustomDialog();
      }),
    ).then((value) {
      if (value != null && value == true) {
        Navigator.of(context).pushNamed(RouteConstants.loginRoute);
      }
    });
  }
}
