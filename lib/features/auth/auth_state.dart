import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';

class AuthState {
  final AuthStateEnum authStateEnum;
  final AuthStateFailureType? authStateFailureType;
  final UserModel? userModel;
  final String? message;

  AuthState({
    required this.authStateEnum,
    required this.userModel,
    this.message,
    this.authStateFailureType,
  });

  factory AuthState.initial() {
    return AuthState(
        authStateEnum: AuthStateEnum.initial,
        userModel: null,
        message: null,
        authStateFailureType: null);
  }

  factory AuthState.loading() {
    return AuthState(
        authStateEnum: AuthStateEnum.loading,
        userModel: null,
        message: null,
        authStateFailureType: null);
  }

  factory AuthState.success(UserModel? data) {
    return AuthState(
      authStateEnum: AuthStateEnum.success,
      userModel: data,
      message: null,
      authStateFailureType: null,
    );
  }

  factory AuthState.failure(
      {required String message,
      required AuthStateFailureType authStateFailureType}) {
    return AuthState(
      authStateEnum: AuthStateEnum.failure,
      userModel: null,
      message: message,
      authStateFailureType: authStateFailureType,
    );
  }
}
