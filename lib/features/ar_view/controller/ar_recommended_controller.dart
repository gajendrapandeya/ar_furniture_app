// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

final arRecommendedProvider = StateNotifierProvider.autoDispose<
    ArRecommendedNotifier, ArRecommendedModel>((ref) {
  return ArRecommendedNotifier();
});

class ArRecommendedModel {
  final String imageUrl;
  final int selectedIndex;

  ArRecommendedModel({
    required this.imageUrl,
    required this.selectedIndex,
  });

  factory ArRecommendedModel.initial() =>
      ArRecommendedModel(imageUrl: '', selectedIndex: 0);

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
  ArRecommendedNotifier()
      : super(
          ArRecommendedModel.initial(),
        );

  void setImageUrl({required String imageUrl}) {
    state = state.copyWith(imageUrl: imageUrl);
  }

  void setIndex({required int index}) {
    state = state.copyWith(selectedIndex: index);
  }
}
