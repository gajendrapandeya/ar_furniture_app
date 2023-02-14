// ignore_for_file: must_be_immutable

import 'package:ar_furniture_app/core/constants/asset_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/custom_text_form_field.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/core/widgets/success_dialog.dart';
import 'package:ar_furniture_app/features/auth/auth_state.dart';
import 'package:ar_furniture_app/features/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Displays the Reset Password page of the app
/// Allows resetting password with email

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});

  String email = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(forgotPasswordProvider);
    ref.listen<AuthState>(forgotPasswordProvider, (prevState, currentState) {
      if (currentState.authStateEnum == AuthStateEnum.success) {
        showDialog(
          context: context,
          builder: (context) => SuccessDialog(
            title: 'Email Sent!',
            buttonText: 'Done',
            onBtnPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteConstants.loginRoute,
                (Route<dynamic> route) => false,
              );
            },
            subTitle:
                'Check Your Email And Open The Link To Continue. You May Need To Check Your Spam Folder.',
          ),
        );
      } else if (currentState.authStateEnum == AuthStateEnum.failure &&
          currentState.authStateFailureType == AuthStateFailureType.none) {
        context.showErrorSnackBar(
          message: currentState.message ?? 'Unknown Error',
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            MdiIcons.chevronLeftCircle,
          ),
        ),
        title: Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: Alignment.center,
                child: ImageWidget(
                  url: AssetConstants.forgotPassword,
                  isSvg: true,
                  imageFit: BoxFit.contain,
                  imageWidth: MediaQuery.of(context).size.width * 0.5,
                  imageHeight: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              VerticalSpacer.exl,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              VerticalSpacer.s,
              CustomTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                errorText: authState.authStateEnum == AuthStateEnum.failure &&
                        authState.authStateFailureType ==
                            AuthStateFailureType.emptyEmail
                    ? authState.message
                    : null,
                onTextChanged: (input) {
                  email = input;
                },
              ),
              VerticalSpacer.exl,
              CustomElevatedButton(
                onButtonPressed: () {
                  resetPassword(
                    email: email,
                    ref: ref,
                  );
                },
                buttonText: 'Send Verfication Link',
                isLoading: authState.authStateEnum == AuthStateEnum.loading,
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword({required String email, required WidgetRef ref}) {
    ref.read(forgotPasswordProvider.notifier).resetPassword(email: email);
  }
}
