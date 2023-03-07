import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/features/profile/core/service/profile_service.dart';
import 'package:ar_furniture_app/features/profile/update_profile/controller/update_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateUserDetailProvider = StateNotifierProvider.family
    .autoDispose<UpdateUserDetailController, UpdateProfileState, UserModel>(
        (ref, userModel) {
  return UpdateUserDetailController(
      profileService: ref.watch(profileServiceProvider), userModel: userModel);
});

class UpdateUserDetailController extends StateNotifier<UpdateProfileState> {
  final ProfileService _profileService;

  UpdateUserDetailController(
      {required ProfileService profileService, required UserModel userModel})
      : _profileService = profileService,
        super(UpdateProfileState.initial(userModel: userModel));

  void updateUserDetail(
      {required String userId, required Map<String, dynamic> userData}) async {
    try {
      if (!_isFormFieldValid(
          mobileNumber: userData['mobileNumber'],
          fullName: userData['fullName'])) return;
      state = const UpdateProfileState.loading();
      final userModel = await _profileService.updateUserDetail(
          userDetail: userData, userId: userId);
      state = UpdateProfileState.success(userModel: userModel);
    } catch (error) {
      state = UpdateProfileState.error(
          error: error.toString(),
          authStateFailureType: AuthStateFailureType.none);
    }
  }

  bool _isFormFieldValid({
    required String mobileNumber,
    required String fullName,
  }) {
    if (fullName.isEmpty) {
      state = const UpdateProfileState.error(
          error: 'Name cannot be empty',
          authStateFailureType: AuthStateFailureType.emptyUsername);
      return false;
    }

    if (mobileNumber.isEmpty) {
      return true;
    }

    return true;
  }
}
