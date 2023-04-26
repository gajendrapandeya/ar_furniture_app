import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/widgets/custom_app_bar.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/features/category/controller/category_controller.dart';
import 'package:ar_furniture_app/features/category/model/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Category'),
      body: ref.watch(categoryProvider).when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            success: (categoriesList) => _buildCategories(categoriesList),
            error: (error) => GenericErrorWidget(error: error),
          ),
    );
  }

  Widget _buildCategories(List<Category> categoriesList) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: GridView.builder(
        itemCount: categoriesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: ((context, index) => InkWell(
              onTap: () => Navigator.of(context)
                  .pushNamed(RouteConstants.categoryProductRoute, arguments: {
                'categoryId': categoriesList[index].id,
                'categoryName': categoriesList[index].name,
              }),
              child: _buildCategoryItem(categoriesList[index], context),
            )),
      ),
    );
  }

  Widget _buildCategoryItem(Category category, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: category.imageUrl,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              category.name,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
