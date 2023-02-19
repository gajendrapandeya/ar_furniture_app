import 'package:ar_furniture_app/features/category/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.loading() = CategoryStateLoading;
  const factory CategoryState.success({required List<Category> categories}) =
      CategoryStateSuccess;
  const factory CategoryState.error({required String error}) =
      CategoryStateError;
}
