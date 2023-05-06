import 'package:ar_furniture_app/features/search/controller/search_state.dart';
import 'package:ar_furniture_app/features/search/service/search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(
    searchService: ref.watch(searchServiceProvider),
  );
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier({required SearchService searchService})
      : _searchService = searchService,
        super(const SearchState.initial());
  final SearchService _searchService;

  Future<void> searchProduct({
    required String searchQuery,
    String? filterType,
  }) async {
    try {
      state = const SearchState.loading();
      final result = await _searchService.searchProducts(
        searchQuery: searchQuery,
        filterType: filterType,
      );
      state = SearchStateSuccess(products: result);
    } catch (error) {
      state = SearchState.error(
        error: error.toString(),
      );
    }
  }
}
