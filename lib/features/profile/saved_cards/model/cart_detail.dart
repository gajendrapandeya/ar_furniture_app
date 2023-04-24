import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_detail.freezed.dart';
part 'cart_detail.g.dart';

@freezed
class CardDetail with _$CardDetail {
  const factory CardDetail({
    required String cardNumber,
    required String id,
    required String cvv,
    required String expiryDate,
    required String zipCode,
  }) = _CardDetail;

  factory CardDetail.fromJson(Map<String, dynamic> json) =>
      _$CardDetailFromJson(json);
}
