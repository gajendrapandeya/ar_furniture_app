import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/core/service/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginController, AuthState>(
  (ref) => LoginController(
    authService: ref.watch(authServiceProvider),
  ),
);

/// Handle the logic of the login screen
class LoginController extends StateNotifier<AuthState> {
  final AuthenticationService _authService;

  LoginController({
    required AuthenticationService authService,
  })  : _authService = authService,
        super(AuthState.initial());

  // Sign in a user with email and password,
  // and validate validate the form fields
  void loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (!(_isFormFieldValid(email: email, password: password))) return;
      state = AuthState.loading();
      await _authService.logInWithEmailAndPassword(
          email: email, password: password);
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

  // Signing in a user with google
  void signInWithGoogle() {
    try {
      state = AuthState.loading();
      _authService.signInWithGoogle().then((user) {
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

  // Validate the form fields
  bool _isFormFieldValid({
    required String email,
    required String password,
  }) {
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
