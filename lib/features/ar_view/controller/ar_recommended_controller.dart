// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

final arRecommendedProvider = StateNotifierProvider.family
    .autoDispose<ArRecommendedNotifier, ArRecommendedModel, String>(
        (ref, imageUrl) {
  return ArRecommendedNotifier(imageUrl: imageUrl);
});

class ArRecommendedModel {
  final String imageUrl;
  final int selectedIndex;

  ArRecommendedModel({
    required this.imageUrl,
    required this.selectedIndex,
  });

  ArRecommendedModel copyWith({
    String? imageUrl,
    int? selectedIndex,
  }) {
    return ArRecommendedModel(
      imageUrl: imageUrl ?? this.imageUrl,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

class ArRecommendedNotifier extends StateNotifier<ArRecommendedModel> {
  ArRecommendedNotifier({
    required this.imageUrl,
  }) : super(
          ArRecommendedModel(imageUrl: imageUrl, selectedIndex: 0),
        );

  final String imageUrl;

  void setImageUrl({required String imageUrl}) {
    state = state.copyWith(imageUrl: imageUrl);
  }

  void setIndex({required int index}) {
    state = state.copyWith(selectedIndex: index);
  }
}
