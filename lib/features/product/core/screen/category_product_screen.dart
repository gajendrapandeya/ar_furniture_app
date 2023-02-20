import 'package:ar_furniture_app/features/product/core/controller/product_controller.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(MdiIcons.chevronLeft),
        ),
        title: Text(
          widget.categoryMap['categoryName'],
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
