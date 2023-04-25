import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/custom_app_bar.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/controller/card_controller.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedCardsScreen extends ConsumerStatefulWidget {
  const SavedCardsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SavedCardsScreenState();
}

class _SavedCardsScreenState extends ConsumerState<SavedCardsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(cardNotifier.notifier)
          .fetchSavedCards(userId: ref.read(userNotifierProvider)!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Saved Cards'),
      body: ref.watch(cardNotifier).when(
            loading: () => const LoadingWidget(),
            saveSuccess: () => const SizedBox.shrink(),
            loaded: (savedCards) => _buildSavedCards(savedCards),
            error: (error) => GenericErrorWidget(error: error),
          ),
    );
  }

  Widget _buildSavedCards(List<CardDetail> savedCards) {
    return ListView.builder(
        itemBuilder: ((context, index) => _buildListItem(savedCards[index])),
        itemCount: savedCards.length);
  }

  Widget _buildListItem(CardDetail savedCard) {
    return CreditCardWidget(
      onCreditCardWidgetChange: (value) {},
      cardNumber: savedCard.cardNumber,
      expiryDate: savedCard.expiryDate,
      isChipVisible: true,
      cardBgColor: Colors.black45,
      // glassmorphismConfig: Glassmorphism.defaultConfig(),
      cardHolderName: ref.read(userNotifierProvider)?.displayName ?? '',
      cvvCode: savedCard.cvv,
      showBackView: false,
    );
  }
}
