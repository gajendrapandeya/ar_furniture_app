import 'package:ar_furniture_app/features/profile/saved_cards/controller/card_state.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/service/card_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardNotifier = StateNotifierProvider<CardNotifier, CardState>((ref) {
  return CardNotifier(
    cardService: ref.watch(cardServiceProvider),
  );
});

class CardNotifier extends StateNotifier<CardState> {
  CardNotifier({required CardService cardService})
      : _cardService = cardService,
        super(const CardState.loading());

  final CardService _cardService;

  Future<void> saveCard(
      {required CardDetail cardDetail, required String userId}) async {
    try {
      await _cardService.saveCard(cardDetail: cardDetail, userId: userId);
      state = const CardState.saveSuccess();
    } catch (error) {
      state = CardState.error(
        error: error.toString(),
      );
    }
  }

  Future<void> fetchSavedCards({required String userId}) async {
    try {
      final savedCards = await _cardService.fetchSavedCards(
        userId: userId,
      );
      state = CardState.loaded(cardList: savedCards);
    } catch (error) {
      state = CardState.error(error: error.toString());
    }
  }
}
