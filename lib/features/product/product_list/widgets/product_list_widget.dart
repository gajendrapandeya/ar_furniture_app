import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/features/product/core/controller/product_controller.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_item_widget.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListWidget extends ConsumerWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      itemCount: products.length,
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
                arguments: products[index],
              );
            },
            child: ProductListItem(
              product: products[index],
            ),
          )),
    );
  }
}
