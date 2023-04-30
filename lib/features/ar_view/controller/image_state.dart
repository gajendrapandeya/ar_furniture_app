import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.loading() = ImageStateLoading;
  const factory ImageState.success({required String imageUrl}) =
      ImageStateSuccess;
  const factory ImageState.error({required String error}) = ImageStateError;
}
