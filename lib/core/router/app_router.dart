import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:ar_furniture_app/features/auth/login/login_screen.dart';
import 'package:ar_furniture_app/features/auth/register/register_screen.dart';
import 'package:ar_furniture_app/features/home/home_screen.dart';
import 'package:ar_furniture_app/features/onboarding/onboarding_screen.dart';
import 'package:ar_furniture_app/features/profile/change_password/change_password_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RouteConstants.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteConstants.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteConstants.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteConstants.chnagePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case RouteConstants.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
