import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/search/controller/search_controller.dart';
import 'package:ar_furniture_app/features/search/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (value) {
          debugPrint('value: $value');
          ref.read(searchProvider.notifier).searchProduct(searchQuery: value);
        },
        onFilterClicked: () {},
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
        title: 'Not Found',
      );
    }
    return ListView.separated(
        padding: const EdgeInsets.all(
          16,
        ),
        itemBuilder: ((context, index) => Text(products[index].name)),
        separatorBuilder: ((context, index) => VerticalSpacer.l),
        itemCount: products.length);
  }
}
