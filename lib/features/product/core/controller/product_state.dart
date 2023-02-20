import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductStateInitial;
  const factory ProductState.loading() = ProductStateLoading;
  const factory ProductState.loaded({required List<Product> products}) =
      ProductStateLoaded;
  const factory ProductState.error({required String error}) = ProductStateError;
}
