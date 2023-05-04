import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_item_widget.dart';
import 'package:ar_furniture_app/features/recommendation/controller/recommendation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendedProductListView extends ConsumerStatefulWidget {
  const RecommendedProductListView({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecommendedProductScreenState();
}

class _RecommendedProductScreenState
    extends ConsumerState<RecommendedProductListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(recommendationProvider.notifier)
          .getRecommendedProducts(productId: widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(recommendationProvider).when(
          initial: () => const LoadingWidget(),
          loading: () => const LoadingWidget(),
          loaded: (recommendedProducts) =>
              _buildRecommendedProductList(recommendedProducts),
          error: (error) => GenericErrorWidget(error: error),
        );
  }

  Widget _buildRecommendedProductList(List<Product> recommendedProducts) {
    if (recommendedProducts.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const Text(
            'No Recommended Products Found.',
          ),
        ],
      );
    }
    return GridView.builder(
      itemCount: recommendedProducts.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: ((context, index) => InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteConstants.productDetailRoute,
                arguments: recommendedProducts[index],
              );
            },
            child: ProductListItem(
              product: recommendedProducts[index],
            ),
          )),
    );
  }
}
