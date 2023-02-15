import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/core/service/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePasswordProvider =
    StateNotifierProvider.autoDispose<ChangePasswordController, AuthState>(
  (ref) =>
      ChangePasswordController(authService: ref.watch(authServiceProvider)),
);

class ChangePasswordController extends StateNotifier<AuthState> {
  final AuthenticationService _authService;

  ChangePasswordController({
    required AuthenticationService authService,
  })  : _authService = authService,
        super(AuthState.initial());

  // Takes in the old password, new password and confirm new password
  // It will then check if the old password is correct.
  // - If it is, it will change the password to the new password
  // - If not, it will throw an error
  // It will also check if the new password and confirm new password are the same
  // - If they are not, it will throw an error
  void changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      if (!(_isFormFieldValid(
          oldPassword: oldPassword,
          newPassword: newPassword,
          confirmNewPassword: confirmNewPassword))) return;
      state = AuthState.loading();
      await _authService.changePassword(
          oldPassword: oldPassword, newPassword: newPassword);
      state = AuthState.success(null);
    } on CustomFirebaseException catch (e) {
      state = AuthState.failure(
          message: e.failure.message,
          authStateFailureType: AuthStateFailureType.none);
    } catch (error) {
      state = AuthState.failure(
          message: error.toString(),
          authStateFailureType: AuthStateFailureType.none);
    }
  }

  // Checks if the form fields are valid
  bool _isFormFieldValid({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) {
    if (oldPassword.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyOldPassword,
        message: 'Old Password cannot be empty',
      );
      return false;
    }
    if (newPassword.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyPassword,
        message: 'New Password cannot be empty',
      );
      return false;
    }

    if (confirmNewPassword.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyConfirmPassowrd,
        message: 'Confirm New Password cannot be empty',
      );
      return false;
    }

    if (newPassword != confirmNewPassword) {
      state = AuthState.failure(
        authStateFailureType:
            AuthStateFailureType.newPasswordAndConfirmNewPasswordNotSame,
        message: 'New Password and Confirm New Password are not same',
      );
      return false;
    }
    return true;
  }
}
