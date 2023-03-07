import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const Product._();
  const factory Product({
    required final String? id,
    required final String? categoryId,
    required final String? name,
    required final List<String> imageUrls,
    required final int? price,
    required final double rating,
    required final String? description,
    required final List<String> colors,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  bool get isRatingAvailable => rating != 0.0;

  bool get isDescriptionAvailable => description != null;

  String get formattedPrice => 'NPR: $price';
}
