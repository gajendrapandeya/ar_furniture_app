import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/core/service/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthenticationController, AuthState>((ref) {
  return AuthenticationController(
    authService: ref.watch(authServiceProvider),
  );
});

class AuthenticationController extends StateNotifier<AuthState> {
  final AuthenticationService _authService;

  AuthenticationController({
    required AuthenticationService authService,
  })  : _authService = authService,
        super(
          AuthState.initial(),
        );

  // Log the user out
  void logout() async {
    try {
      state = AuthState.loading();
      await _authService.logOut();
      state = AuthState.success(
        null,
      );
    } on CustomFirebaseException catch (e) {
      state = AuthState.failure(
        message: e.failure.message,
        authStateFailureType: AuthStateFailureType.none,
      );
    } catch (error) {
      state = AuthState.failure(
        message: error.toString(),
        authStateFailureType: AuthStateFailureType.none,
      );
    }
  }

  /// Delete account
  void deleteAccount() async {
    try {
      state = AuthState.loading();
      await _authService.deleteAccount();
      state = AuthState.success(
        null,
      );
    } on CustomFirebaseException catch (e) {
      state = AuthState.failure(
        message: e.failure.message,
        authStateFailureType: AuthStateFailureType.none,
      );
    } catch (error) {
      state = AuthState.failure(
        message: error.toString(),
        authStateFailureType: AuthStateFailureType.none,
      );
    }
  }
}
