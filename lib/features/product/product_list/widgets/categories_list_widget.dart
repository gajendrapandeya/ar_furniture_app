import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/category/controller/category_controller.dart';
import 'package:ar_furniture_app/features/category/model/category.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/category_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryIndexProvider = StateProvider<int>((ref) => 0);

class CategoryListWidget extends ConsumerWidget {
  const CategoryListWidget({
    super.key,
    required this.onCategorySelected,
  });

  final void Function(String) onCategorySelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryIndex = ref.watch(selectedCategoryIndexProvider);
    return ref.watch(categoryProvider).when(
          initial: () => const SizedBox(
            height: 18,
            child: CategoryLoadingWidget(),
          ),
          loading: () => const SizedBox(
            height: 18,
            child: CategoryLoadingWidget(),
          ),
          success: (categories) {
            final List<Category> mutableCategories = categories.toList();
            mutableCategories.insert(
                0, const Category(id: '', name: 'All', imageUrl: ''));
            final addedCategories = mutableCategories;
            return SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () {
                        final selectedCategory = addedCategories[index];
                        ref
                            .read(selectedCategoryIndexProvider.notifier)
                            .update((state) => state = index);

                        if (selectedCategory.imageUrl.isEmpty) {
                          onCategorySelected('');
                        } else {
                          onCategorySelected(selectedCategory.id);
                        }
                      },
                      child: _buildListItem(
                        category: addedCategories[index],
                        isSelected: selectedCategoryIndex == index,
                        context: context,
                      ),
                    )),
                separatorBuilder: ((context, index) => HorizontalSpacer.xxxl),
                itemCount:
                    addedCategories.length >= 5 ? 5 : addedCategories.length,
              ),
            );
          },
          error: (error) => GenericErrorWidget(error: error),
        );
  }

  Widget _buildListItem({
    required Category category,
    required bool isSelected,
    required BuildContext context,
  }) {
    var textSize = _calculateTextSize(
        category.name, Theme.of(context).textTheme.titleMedium!);
    return Column(
      children: [
        Text(
          category.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.tertiary
                    : Colors.grey.shade500,
              ),
        ),
        VerticalSpacer.xxs,
        if (isSelected)
          Container(
            width: textSize.width,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
      ],
    );
  }

  Size _calculateTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }
}
