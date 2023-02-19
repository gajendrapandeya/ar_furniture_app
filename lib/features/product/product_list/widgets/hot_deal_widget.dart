import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/hot_deal/hot_deal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotDealWidget extends StatefulWidget {
  const HotDealWidget({super.key});

  @override
  State<HotDealWidget> createState() => _HotDealWidgetState();
}

class _HotDealWidgetState extends State<HotDealWidget> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: hotDealsList.length,
            itemBuilder: ((_, index) => _buildItem(
                  hotDealsList[index],
                )),
          ),
        ),
        VerticalSpacer.s,
        SmoothPageIndicator(
          controller: _pageController,
          count: hotDealsList.length,
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

  Widget _buildItem(HotDeal hotDeal) {
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
            imageUrl: hotDeal.imageUrl,
          ),
        ),
        Positioned(
          top: 32,
          left: 8,
          child: Text(
            hotDeal.description.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 8,
          child: Text(
            hotDeal.hashTag.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        )
      ],
    );
  }
}
