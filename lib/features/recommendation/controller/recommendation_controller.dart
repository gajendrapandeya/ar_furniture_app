import 'package:ar_furniture_app/features/product/core/controller/product_state.dart';
import 'package:ar_furniture_app/features/recommendation/service/recommendation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recommendationProvider =
    StateNotifierProvider<RecommendationNotifier, ProductState>((ref) {
  return RecommendationNotifier(
    recommendationService: ref.read(recommendationServiceProvider),
  );
});

class RecommendationNotifier extends StateNotifier<ProductState> {
  RecommendationNotifier({required RecommendationService recommendationService})
      : _recommendationService = recommendationService,
        super(
          const ProductState.initial(),
        );

  final RecommendationService _recommendationService;

  Future<void> getRecommendedProducts({required String productId}) async {
    try {
      state = const ProductState.loading();
      final recommendedProducts = await _recommendationService
          .fetchRecommendedProducts(productId: productId);
      state = ProductState.loaded(products: recommendedProducts);
    } catch (error) {
      state = ProductState.error(error: error.toString());
    }
  }
}
