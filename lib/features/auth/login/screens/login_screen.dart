// ignore_for_file: must_be_immutable

import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/storage_provider.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/custom_text_form_field.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/social_media_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/login/controller/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(loginProvider);
    ref.listen<AuthState>(loginProvider, (prevState, currentState) {
      if (currentState.authStateEnum == AuthStateEnum.success) {
        Navigator.of(context).pushNamed(RouteConstants.homeRoute);
      } else if (currentState.authStateEnum == AuthStateEnum.failure &&
          currentState.authStateFailureType == AuthStateFailureType.none) {
        context.showErrorSnackBar(
          message: currentState.message ?? 'Unknown Error',
        );
      }
    });
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacer.l,
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  ref.read(storageProvider).setOnboardingCompleted();
                  Navigator.of(context)
                      .pushReplacementNamed(RouteConstants.homeRoute);
                },
                icon: const Icon(MdiIcons.close),
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ImageWidget(
                url: AssetConstants.login,
                isSvg: true,
                imageWidth: double.infinity,
                imageHeight: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            VerticalSpacer.xxl,
            Text(
              'Let\'s Login.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            VerticalSpacer.s,
            _buildDontHaveAccountText(context),
            VerticalSpacer.xxxl,
            _buildFormFields(authState),
            VerticalSpacer.m,
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                RouteConstants.forgotPasswordRoute,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).colorScheme.tertiary,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
            ),
            VerticalSpacer.xxxl,
            CustomElevatedButton(
              onButtonPressed: () {
                _login(email: email, password: password, ref: ref);
              },
              buttonText: 'Login',
              isLoading: authState.authStateEnum == AuthStateEnum.loading,
            ),
            VerticalSpacer.xxl,
            Align(
              alignment: Alignment.center,
              child: Text(
                'OR',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            VerticalSpacer.xxl,
            _buildSocialMediaButtons(ref),
          ],
        ),
      ),
    ));
  }

  RichText _buildDontHaveAccountText(
    BuildContext context,
  ) {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account yet?',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey.shade600,
              fontSize: 10,
            ),
        children: [
          TextSpan(
            text: ' Sign Up',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushNamed(
                  RouteConstants.registerRoute,
                );
              },
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(AuthState authState) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Email',
          errorText: authState.authStateEnum == AuthStateEnum.failure &&
                  authState.authStateFailureType ==
                      AuthStateFailureType.emptyEmail
              ? authState.message
              : null,
          onTextChanged: (input) {
            email = input;
          },
        ),
        VerticalSpacer.xl,
        CustomTextFormField(
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          errorText: authState.authStateEnum == AuthStateEnum.failure &&
                  authState.authStateFailureType ==
                      AuthStateFailureType.emptyPassword
              ? authState.message
              : null,
          onTextChanged: (input) {
            password = input;
          },
        ),
      ],
    );
  }

  Widget _buildSocialMediaButtons(WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: SocialMediaButton(
            onBtnPressed: () {
              ref.read(loginProvider.notifier).signInWithFacebok();
            },
            buttonText: 'Facebook',
            iconData: MdiIcons.facebook,
            iconColor: Colors.blue,
          ),
        ),
        HorizontalSpacer.s,
        Expanded(
          child: SocialMediaButton(
            onBtnPressed: () {
              ref.read(loginProvider.notifier).signInWithGoogle();
            },
            buttonText: 'Google',
            iconData: MdiIcons.google,
            iconColor: Colors.red,
          ),
        )
      ],
    );
  }

  void _login({
    required String email,
    required String password,
    required WidgetRef ref,
  }) {
    ref.read(loginProvider.notifier).loginWithEmailAndPassword(
          email: email,
          password: password,
        );
  }
}
