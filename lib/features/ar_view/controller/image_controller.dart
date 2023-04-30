import 'package:ar_furniture_app/features/ar_view/controller/image_state.dart';
import 'package:ar_furniture_app/features/ar_view/service/image_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = StateNotifierProvider<ImageNotifier, ImageState>((ref) {
  return ImageNotifier(
    imageService: ref.read(imageServiceProvider),
  );
});

class ImageNotifier extends StateNotifier<ImageState> {
  ImageNotifier({required ImageService imageService})
      : _imageService = imageService,
        super(const ImageStateLoading());

  final ImageService _imageService;

  Future<void> getImageUrl(
      {required String imageUrl, required String apiKey}) async {
    try {
      final result = await _imageService.removeImageBackground(
          imagePath: imageUrl, apiKey: apiKey);
      state = ImageState.success(imageUrl: result);
    } catch (error) {
      state = ImageState.error(
        error: error.toString(),
      );
    }
  }
}
