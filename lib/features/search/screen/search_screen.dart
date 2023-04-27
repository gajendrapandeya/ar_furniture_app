import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/widgets/custom_rating_widget.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/search/controller/search_controller.dart';
import 'package:ar_furniture_app/features/search/widgets/filter_widget.dart';
import 'package:ar_furniture_app/features/search/widgets/search_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(searchProvider.notifier).searchProduct(searchQuery: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (value) {
          ref.read(searchProvider.notifier).searchProduct(
                searchQuery: value,
              );
        },
        onFilterClicked: () {
          _showBottomSheet();
        },
        onClearClicked: () {
          ref.read(searchProvider.notifier).searchProduct(searchQuery: '');
        },
      ),
      body: ref.watch(searchProvider).when(
            initial: () => const SizedBox.shrink(),
            loading: () => const LoadingWidget(),
            success: (products) => _buildProductList(products),
            error: (error) => GenericErrorWidget(error: error),
          ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    if (products.isEmpty) {
      return const NoDataWidget(
        title: 'Not Product Found',
      );
    }
    return ListView.separated(
        padding: const EdgeInsets.all(
          16,
        ),
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteConstants.productDetailRoute,
                  arguments: products[index],
                );
              },
              child: _buildListItem(
                products[index],
              ),
            )),
        separatorBuilder: ((context, index) => VerticalSpacer.xxl),
        itemCount: products.length);
  }

  Widget _buildListItem(Product product) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: product.imageUrls.first,
            imageBuilder: (context, imageProvider) => Container(
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            placeholder: (context, url) => const LoadingWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          HorizontalSpacer.l,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                VerticalSpacer.xs,
                CustomRatingWidget(
                  initialRating: product.rating,
                  ratingIconSize: 16,
                ),
                const Spacer(),
                Text(
                  product.formattedPrice,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterWidget(
        onApplyClicked: (filterType) {
          debugPrint('filtetype; $filterType');
          Navigator.of(context).pop();
          ref
              .read(searchProvider.notifier)
              .searchProduct(searchQuery: '', filterType: filterType);
        },
      ),
    );
  }
}
