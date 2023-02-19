import 'package:ar_furniture_app/features/category/controller/category_state.dart';
import 'package:ar_furniture_app/features/category/service/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider =
    StateNotifierProvider<CategoryController, CategoryState>((ref) {
  return CategoryController(
    categoryService: ref.watch(categoryServiceProvider),
  );
});

class CategoryController extends StateNotifier<CategoryState> {
  final CategoryService _categoryService;

  CategoryController({required CategoryService categoryService})
      : _categoryService = categoryService,
        super(const CategoryState.loading());

  Future<void> loadCategories() async {
    try {
      final categories = await _categoryService.fetchCategories();
      state = CategoryState.success(categories: categories);
    } catch (error) {
      state = CategoryState.error(
        error: error.toString(),
      );
    }
  }
}
