import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_state.freezed.dart';

@freezed
class CardState with _$CardState {
  const factory CardState.loading() = CardStateLoading;
  const factory CardState.saveSuccess() = CardStateSaveSuccess;
  const factory CardState.loaded({required List<CardDetail> cardList}) =
      CardStateLoaded;
  const factory CardState.error({required String error}) = CardStateError;
}
