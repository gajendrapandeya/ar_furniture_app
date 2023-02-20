import 'package:ar_furniture_app/features/product/core/controller/product_state.dart';
import 'package:ar_furniture_app/features/product/core/service/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider =
    StateNotifierProvider<ProductController, ProductState>((ref) {
  return ProductController(
    service: ref.watch(productServiceProvider),
  );
});

class ProductController extends StateNotifier<ProductState> {
  final ProductService _service;

  ProductController({required ProductService service})
      : _service = service,
        super(
          const ProductState.initial(),
        );

  void fetchProducts({required String categoryId}) async {
    try {
      state = const ProductState.loading();
      final products = await _service.fetchProducts(categoryId: categoryId);
      state = ProductState.loaded(products: products);
    } catch (error) {
      state = ProductState.error(error: error.toString());
    }
  }
}
