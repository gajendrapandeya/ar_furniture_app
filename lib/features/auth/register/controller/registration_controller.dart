import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/core/service/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registrationProvider =
    StateNotifierProvider.autoDispose<RegistrationController, AuthState>(
  (ref) => RegistrationController(
    authService: ref.watch(authServiceProvider),
  ),
);

/// Handles the logic of the registration screen
class RegistrationController extends StateNotifier<AuthState> {
  final AuthenticationService _authService;

  RegistrationController({
    required AuthenticationService authService,
  })  : _authService = authService,
        super(AuthState.initial());

  // Register the users
  void register(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      if (!(_isFormFieldValid(
          email: email, password: password, fullName: fullName))) return;

      state = AuthState.loading();

      final userModel = await _authService.register(
        email: email,
        password: password,
        fullName: fullName,
      );
      state = AuthState.success(userModel);
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

  // Register with Google
  void signInWithGoogle() async {
    try {
      state = AuthState.loading();
      final userModel = await _authService.signInWithGoogle();
      state = AuthState.success(userModel);
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

  // Signing in a user with facebook
  void signInWithFacebok() {
    try {
      state = AuthState.loading();
      _authService.signInWithFacebook().then((user) {
        state = AuthState.success(user);
      });
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

  // Validate form fields
  bool _isFormFieldValid({
    required String email,
    required String password,
    required String fullName,
  }) {
    if (fullName.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyUsername,
        message: 'Name cannot be empty',
      );
      return false;
    }

    if (email.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyEmail,
        message: 'Email cannot be empty',
      );
      return false;
    }

    if (password.isEmpty) {
      state = AuthState.failure(
        authStateFailureType: AuthStateFailureType.emptyPassword,
        message: 'Password cannot be empty',
      );
      return false;
    }

    return true;
  }
}
