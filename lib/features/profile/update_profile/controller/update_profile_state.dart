import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_state.freezed.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  /// When user navigates to update profile screen, userModel is passed from ProfielScreen
  const factory UpdateProfileState.initial({required UserModel userModel}) =
      UpdateProfileStateInitial;
  const factory UpdateProfileState.loading() = UpdateProfileStateLoading;

  /// When user updates profile, in success userModel is returned
  const factory UpdateProfileState.success({required UserModel userModel}) =
      UpdateProfileStateSucces;
  const factory UpdateProfileState.error(
          {required String error,
          required AuthStateFailureType authStateFailureType}) =
      UpdateProfileStateError;
}
