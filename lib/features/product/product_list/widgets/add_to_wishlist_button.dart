import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_dialog.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_item_controller.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddToWishlistButton extends ConsumerStatefulWidget {
  const AddToWishlistButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddToWishlistButtonState();
}

class _AddToWishlistButtonState extends ConsumerState<AddToWishlistButton> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final userId = ref.read(userNotifierProvider)?.uid;
      ref.read(wishListItemProvider(_product.id).notifier).isInWishList(
            userId: userId ?? '',
            productId: _product.id,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<WishlistItemState>(wishListItemProvider(_product.id),
        (previous, currentState) {
      if (currentState is WishlistItemStateAddedtoWishlist) {
        context.showSuccessSnackBar(
            message: 'Added to wish list successfully.');
      }
    });
    final wishlistItemState = ref.watch(wishListItemProvider(_product.id));
    return LikeButton(
      size: 18,
      bubblesColor: BubblesColor(
        dotPrimaryColor: Theme.of(context).colorScheme.tertiary,
        dotSecondaryColor: Theme.of(context).colorScheme.tertiary,
      ),
      isLiked: wishlistItemState.maybeWhen(
        orElse: () => false,
        success: (isInlist) => isInlist,
        addedToWishlist: () => true,
      ),
      onTap: (isLiked) async {
        if (ref.read(userNotifierProvider) != null) {
          return await _onLikeButtonTapped(
              isLiked, ref, ref.read(userNotifierProvider)!.uid, _product);
        } else {
          _handleNotLogggedInWishButtonClick(context);
          return false;
        }
      },
      likeBuilder: (isLiked) {
        return Icon(
          MdiIcons.heart,
          color: wishlistItemState.maybeWhen(
            orElse: () => Colors.grey,
            success: (isInWishlist) => isInWishlist
                ? Theme.of(context).colorScheme.tertiary
                : Colors.grey,
            addedToWishlist: () => Theme.of(context).colorScheme.tertiary,
          ),
          size: 18,
        );
      },
      circleColor: CircleColor(
        start: Theme.of(context).colorScheme.tertiary,
        end: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }

  Future<bool> _onLikeButtonTapped(
      bool isLiked, WidgetRef ref, String userId, Product product) async {
    ref
        .read(wishListItemProvider(product.id).notifier)
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
