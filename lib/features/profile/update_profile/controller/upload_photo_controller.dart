import 'dart:io';

import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/network_state.dart';
import 'package:ar_furniture_app/features/profile/core/service/profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadPhotoProvider =
    StateNotifierProvider<UploadPhotoController, NetworkState>((ref) {
  return UploadPhotoController(
      profileService: ref.watch(profileServiceProvider));
});

class UploadPhotoController extends StateNotifier<NetworkState> {
  final ProfileService _profileService;

  UploadPhotoController({required ProfileService profileService})
      : _profileService = profileService,
        super(NetworkState.initial());

  void uploadPhoto({required String userId, required File file}) async {
    try {
      state = NetworkState.loading();
      final photoUrl = await _profileService.updateProfilePicture(
          file: file, userId: userId);
      state = NetworkState.success(photoUrl);
    } on CustomFirebaseException catch (e) {
      state = NetworkState.failure(
        e.failure.message,
      );
    } catch (error) {
      state = NetworkState.failure(
        error.toString(),
      );
    }
  }
}
