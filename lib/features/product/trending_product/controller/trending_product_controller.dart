import 'package:ar_furniture_app/features/product/core/controller/product_state.dart';
import 'package:ar_furniture_app/features/product/trending_product/service/trending_product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendingProductController =
    StateNotifierProvider<TrendingProductNotifier, ProductState>((ref) {
  return TrendingProductNotifier(
    trendingProductService: ref.read(trendingProductService),
  );
});

class TrendingProductNotifier extends StateNotifier<ProductState> {
  TrendingProductNotifier(
      {required TrendingProductService trendingProductService})
      : _trendingProductService = trendingProductService,
        super(
          const ProductState.initial(),
        );

  final TrendingProductService _trendingProductService;

  Future<void> getTrendingProducts() async {
    try {
      state = const ProductState.loading();
      final recommendedProducts =
          await _trendingProductService.getTrendingProducts();
      state = ProductState.loaded(products: recommendedProducts);
    } catch (error) {
      state = ProductState.error(error: error.toString());
    }
  }
}
