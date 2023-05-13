import 'package:ar_furniture_app/core/utils/string_utils.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/trending_product/controller/trending_product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TrendingProductWidget extends ConsumerStatefulWidget {
  const TrendingProductWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TrendingProductWidgetState();
}

class _TrendingProductWidgetState extends ConsumerState<TrendingProductWidget> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(trendingProductController.notifier).getTrendingProducts();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(trendingProductController).when(
        initial: () => const LoadingWidget(),
        loading: () => const LoadingWidget(),
        loaded: (trendingProducts) => _buildTrendingProducts(trendingProducts),
        error: (error) => GenericErrorWidget(error: error));
  }

  Widget _buildTrendingProducts(List<Product> trendingProducts) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: trendingProducts.length,
            itemBuilder: ((_, index) => _buildItem(
                  trendingProducts[index],
                )),
          ),
        ),
        VerticalSpacer.s,
        SmoothPageIndicator(
          controller: _pageController,
          count: trendingProducts.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Theme.of(context).colorScheme.secondary,
            dotHeight: 8,
            dotWidth: 8,
            dotColor: Colors.grey.shade400,
          ),
          onDotClicked: (index) {},
        ),
      ],
    );
  }

  Widget _buildItem(Product product) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
          child: CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (_, __) => const LoadingWidget(),
            imageUrl: product.imageUrls.first,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 32,
          left: 8,
          child: Text(
            product.name.toTitleCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 8,
          child: Text(
            product.price.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ],
    );
  }
}
