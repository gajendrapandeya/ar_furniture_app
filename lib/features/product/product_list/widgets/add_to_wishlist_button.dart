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
      ref.read(wishListProvider(_product.id).notifier).isInWishList(
            userId: userId ?? '',
            productId: _product.id,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<WishListState>(wishListProvider(_product.id),
        (previous, currentState) {
      if (currentState is WishListStateAddedToWishList) {
        context.showSuccessSnackBar(
            message: 'Added to wish list successfully.');
      }
    });
    final wishListState = ref.watch(wishListProvider(_product.id));
    return LikeButton(
      size: 18,
      bubblesColor: BubblesColor(
        dotPrimaryColor: Theme.of(context).colorScheme.tertiary,
        dotSecondaryColor: Theme.of(context).colorScheme.tertiary,
      ),
      isLiked: (wishListState is WishListStateAlreadyInWishList ||
          wishListState is WishListStateAddedToWishList),
      onTap: (isLiked) async {
        if (ref.read(userNotifierProvider) != null &&
            (wishListState != const WishListStateAlreadyInWishList() ||
                wishListState != const WishListState.addToWishlist())) {
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
          color: (ref.watch(wishListProvider(_product.id))
                      is WishListStateAlreadyInWishList ||
                  ref.watch(wishListProvider(_product.id))
                      is WishListStateAddedToWishList)
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
        .read(wishListProvider(product.id).notifier)
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
