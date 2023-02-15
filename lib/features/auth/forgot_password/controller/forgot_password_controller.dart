import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/core/service/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgotPasswordProvider =
    StateNotifierProvider.autoDispose<ForgotPasswordController, AuthState>(
  (ref) => ForgotPasswordController(
    authService: ref.watch(authServiceProvider),
  ),
);

/// Handle the logic of the forgot password screen
class ForgotPasswordController extends StateNotifier<AuthState> {
  final AuthenticationService _authService;

  ForgotPasswordController({
    required AuthenticationService authService,
  })  : _authService = authService,
        super(AuthState.initial());

// Reset the password of a user, given the email.
// It will then check if the email is valid.
// If the email is valid: it will send a reset password link to the email to  user
  void resetPassword({
    required String email,
  }) async {
    try {
      if (!(_isFormFieldValid(email: email))) return;
      state = AuthState.loading();
      await _authService.resetPassword(email: email);
      state = AuthState.success(
        null,
      );
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

  bool _isFormFieldValid({
    required String email,
  }) {
    if (email.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyEmail,
        message: 'Email cannot be empty',
      );
      return false;
    }

    return true;
  }
}
