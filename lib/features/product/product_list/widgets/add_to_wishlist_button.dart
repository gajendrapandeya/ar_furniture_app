import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_dialog.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_controller.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddToWishlistButton extends ConsumerWidget {
  const AddToWishlistButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<WishListState>(wishListProvider, (previous, currentState) {
      if (currentState is WishListStateAddedToWishList) {
        context.showSuccessSnackBar(
            message: 'Added to wish list successfully.');
      }
    });
    final wishListState = ref.watch(wishListProvider);
    debugPrint('wishlistStae: $wishListState');
    return LikeButton(
      size: 18,
      bubblesColor: BubblesColor(
        dotPrimaryColor: Theme.of(context).colorScheme.tertiary,
        dotSecondaryColor: Theme.of(context).colorScheme.tertiary,
      ),
      isLiked: (wishListState is WishListStateAlreadyInWishList ||
              wishListState is WishListStateAddedToWishList)
          ? true
          : false,
      onTap: (isLiked) async {
        debugPrint('isLiked: $isLiked');
        if (ref.read(userNotifierProvider) != null &&
            (wishListState != const WishListState.alreadyInWishList() ||
                wishListState != const WishListState.addedToWishList())) {
          debugPrint('called');
          return await _onLikeButtonTapped(
              isLiked, ref, ref.read(userNotifierProvider)!.uid, product);
        } else {
          _handleNotLogggedInWishButtonClick(context);
          return false;
        }
      },
      likeBuilder: (isLiked) {
        return Icon(
          MdiIcons.heart,
          color: ref.watch(wishListProvider) is WishListStateAlreadyInWishList
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
