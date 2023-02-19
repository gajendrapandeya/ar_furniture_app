import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required final String id,
    required final String categoryId,
    required final String name,
    required final List<String> imageUrls,
    required final int price,
    required final double rating,
    required final String description,
    required final List<String> color,
    required final List<String> size,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
