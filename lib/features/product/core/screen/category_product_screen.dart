import 'package:ar_furniture_app/core/widgets/custom_app_bar.dart';
import 'package:ar_furniture_app/features/product/core/controller/product_controller.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProductScreen extends ConsumerStatefulWidget {
  const CategoryProductScreen({
    super.key,
    required this.categoryMap,
  });

  final Map<String, dynamic> categoryMap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryProductScreenState();
}

class _CategoryProductScreenState extends ConsumerState<CategoryProductScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(productsProvider.notifier)
          .fetchProducts(categoryId: widget.categoryMap['categoryId']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: widget.categoryMap['categoryName'],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: ProductListWidget(),
      ),
    );
  }
}
