import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/category/controller/category_controller.dart';
import 'package:ar_furniture_app/features/product/core/controller/product_controller.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/categories_list_widget.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/hot_deal_widget.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_app_bar.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(categoryProvider.notifier).loadCategories();
      ref.read(productsProvider.notifier).fetchProducts(categoryId: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductListAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView(
          children: [
            VerticalSpacer.l,
            Text(
              'Find The\nBest Furniture',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
            ),
            VerticalSpacer.l,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              child: const HotDealWidget(),
            ),
            VerticalSpacer.m,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteConstants.categoryRoute);
                  },
                  child: Text(
                    'See All',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                ),
              ],
            ),
            CategoryListWidget(
              onCategorySelected: (categoryId) {
                debugPrint('categoryId: $categoryId');
                ref
                    .read(productsProvider.notifier)
                    .fetchProducts(categoryId: categoryId);
              },
            ),
            VerticalSpacer.l,
            const ProductListWidget(),
          ],
        ),
      ),
    );
  }
}
