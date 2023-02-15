import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/network_state.dart';
import 'package:ar_furniture_app/features/profile/core/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider =
    StateNotifierProvider<ProfileController, NetworkState>((ref) {
  return ProfileController(profileService: ref.read(profileServiceProvider));
});

class ProfileController extends StateNotifier<NetworkState> {
  final ProfileService _profileService;

  ProfileController({
    required ProfileService profileService,
  })  : _profileService = profileService,
        super(NetworkState.initial());

  // Get userData
  void getUserData({required String uid}) async {
    try {
      state = NetworkState.loading();
      final user = await _profileService.getUserData(userId: uid);
      debugPrint('userData: $user');

      state = NetworkState.success(
        user,
      );
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

  /// Update Profile Picture
  void updateProfilePicture({required String imageUrl}) async {
    try {
      state = NetworkState.loading();
      final result = await _profileService.updateProfilePicture(url: imageUrl);
      state = NetworkState.success(
        result,
      );
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
