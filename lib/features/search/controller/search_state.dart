import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchStateInitial;
  const factory SearchState.loading() = SearchStateLoading;
  const factory SearchState.success({required List<Product> products}) =
      SearchStateSuccess;
  const factory SearchState.error({required String error}) = SearchStateError;
}
