import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/add_to_wishlist_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(MdiIcons.chevronLeft),
        ),
      ),
      body: Stack(
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
    );
  }

  Widget _buildProductImageWithLikeButton() {
    final product = widget.product;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(48),
              bottomRight: Radius.circular(48),
            ),
          ),
          child: PageView.builder(
            controller: _pageController,
            clipBehavior: Clip.none,
            itemCount: product.imageUrls.length,
            itemBuilder: (context, index) => Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: ImageWidget(
                    url: product.imageUrls[index],
                    imageWidth: double.infinity,
                    imageFit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: -12,
                  right: 32,
                  child: Container(
                    padding: const EdgeInsets.all(
                      8,
                    ),
                    alignment: Alignment.center,
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
        ),
      ],
    );
  }

  Widget _buildProductDetail() {
    final product = widget.product;
    return Column(
      children: [
        _buildProductImageWithLikeButton(),
        VerticalSpacer.s,
        if (widget.product.imageUrls.length > 1)
          SmoothPageIndicator(
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
        VerticalSpacer.l,
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
              Text(
                product.formattedPrice,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
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

  Row _buildProductNameWithRating(Product product) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name ?? '',
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildLiveViewButton(context),
          ),
          HorizontalSpacer.l,
          Expanded(
            flex: 2,
            child: CustomElevatedButton.withIcon(
              onButtonPressed: () {},
              buttonText: 'Add To Cart',
              iconData: MdiIcons.cart,
            ),
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
      onPressed: () {},
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
}
