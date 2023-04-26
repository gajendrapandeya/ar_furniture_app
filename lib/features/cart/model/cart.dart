import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    required String id,
    required int quantity,
    required String imageUrl,
    required int price,
    required String productDescription,
    required String name,
  }) = _Cart;

  String get formattedPrice => 'Rs. $price';

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
