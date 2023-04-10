// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_dialog.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_state.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/add_to_wishlist_button.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final selectedColorProvider = StateProvider<int>((_) {
  return 0;
});

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    final userId = ref.read(userNotifierProvider)?.uid;
    ref
        .read(cartProvider.notifier)
        .inInCart(userId: userId ?? '', cartId: widget.product.id);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildProductDetail(),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: _buildBottomWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImageWithLikeButton() {
    final product = widget.product;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PageView.builder(
            controller: _pageController,
            clipBehavior: Clip.none,
            itemCount: product.imageUrls.length,
            itemBuilder: (context, index) => Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        56,
                      ),
                      bottomRight: Radius.circular(
                        56,
                      ),
                    ),
                    child: ImageWidget(
                      url: product.imageUrls[index],
                      imageWidth: double.infinity,
                      imageFit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 24,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        MdiIcons.chevronLeft,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -12,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(
                      8,
                    ),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(
                          0xfffefffe,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.1),
                            blurRadius: 4.0,
                            offset: const Offset(2, 4),
                          ),
                        ]),
                    child: AddToWishlistButton(product: product),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetail() {
    final product = widget.product;
    return ListView(
      children: [
        _buildProductImageWithLikeButton(),
        VerticalSpacer.s,
        if (widget.product.imageUrls.length > 1)
          Align(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.product.imageUrls.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.secondary,
                dotHeight: 8,
                dotWidth: 8,
                dotColor: Colors.grey.shade400,
              ),
              onDotClicked: (index) {},
            ),
          ),
        VerticalSpacer.m,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductNameWithRating(product),
              VerticalSpacer.xl,
              _buildProductPriceAndColor(product),
              VerticalSpacer.xxl,
              if (product.isDescriptionAvailable) ...[
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                VerticalSpacer.s,
                Text(
                  product.description ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                )
              ]
            ],
          ),
        )
      ],
    );
  }

  Row _buildProductPriceAndColor(Product product) {
    ref.watch(selectedColorProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product.formattedPrice,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ...product.colors.mapIndexed((index, colorHex) {
          final selectedColorIndex =
              ref.read(selectedColorProvider.notifier).state;
          final isSelected = selectedColorIndex == index;
          return InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              ref.read(selectedColorProvider.notifier).update(
                    (state) => state = index,
                  );
              _pageController.jumpToPage(ref.watch(selectedColorProvider));
            },
            child: Row(
              children: [
                if (isSelected) ...[
                  Container(
                    padding: const EdgeInsets.all(
                      2,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.7),
                          width: 1.0,
                        )),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _hexToColor(colorHex),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ] else
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _hexToColor(colorHex),
                      shape: BoxShape.circle,
                    ),
                  ),
                HorizontalSpacer.s,
              ],
            ),
          );
        }).toList()
      ],
    );
  }

  Color _hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Row _buildProductNameWithRating(Product product) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.rating.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Icon(
                MdiIcons.star,
                color: Colors.amber,
                size: 14,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBottomWidget(BuildContext context) {
    final CartState cartState = ref.watch(cartProvider);
    final product = widget.product;
    User? currentUser = ref.read(userNotifierProvider);
    final cart = Cart(
      id: product.id,
      quantity: 1,
      imageUrl: product.imageUrls.first,
      price: product.price!,
      name: product.name,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: _buildLiveViewButton(context),
          ),
          HorizontalSpacer.l,
          if (cartState != const CartState.alreadyInCart() &&
              cartState != const CartState.addedToCart())
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.52,
              child: CustomElevatedButton.withIcon(
                onButtonPressed: () {
                  if (currentUser == null) {
                    _handleNotLogggedInWhenAddToCartClicked();
                  } else {
                    ref.read(cartProvider.notifier).addProductToCart(
                          userId: currentUser.uid,
                          cart: cart,
                        );
                    context.showSuccessSnackBar(
                      message: 'Successfully added to the cart',
                    );
                  }
                },
                buttonText: 'Add To Cart',
                iconData: MdiIcons.cart,
                isLoading: (cartState == const CartState.loading()) ||
                    (cartState == const CartState.alreadyInCart()),
              ),
            )
          else if (cartState is CartStateLoading)
            Container(
              width: 30,
              height: 30,
              color: Colors.green,
            ),
        ],
      ),
    );
  }

  Widget _buildLiveViewButton(BuildContext context) {
    return OutlinedButton.icon(
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50.0),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: LightColor.platianGreen,
                width: 1.0,
              ),
            ),
          ),
      onPressed: () {
        Navigator.of(context).pushNamed(
          RouteConstants.arViewScreenRoute,
          arguments: widget.product.imageUrls.first,
        );
      },
      icon: const Icon(
        MdiIcons.scanHelper,
        size: 22,
      ),
      label: Text(
        'Live View',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: LightColor.platianGreen,
            ),
      ),
    );
  }

  void _handleNotLogggedInWhenAddToCartClicked() async {
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
