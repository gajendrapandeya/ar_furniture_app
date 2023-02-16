// ignore_for_file: must_be_immutable

import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/profile/update_profile/controller/update_profile_state.dart';
import 'package:ar_furniture_app/features/profile/update_profile/controller/update_user_detail_controller.dart';
import 'package:ar_furniture_app/features/profile/update_profile/widgets/labeled_text_form_field.dart';
import 'package:ar_furniture_app/features/profile/update_profile/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProfileScreen extends ConsumerWidget {
  UpdateProfileScreen({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  String userName = '';
  String mobileNumber = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    userName = userModel.fullName;
    mobileNumber = userModel.mobileNumber ?? '';
    final updateUserProfileProvider =
        ref.watch(updateUserDetailProvider(userModel));
    ref.listen<UpdateProfileState>(updateUserDetailProvider(userModel),
        (previous, currentState) {
      if (currentState is UpdateProfileStateSucces) {
        context.showSuccessSnackBar(message: 'Profile Updated Successfully');
      } else if (currentState is UpdateProfileStateError) {
        context.showErrorSnackBar(message: currentState.error);
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: WillPopScope(
            onWillPop: () async {
              return updateUserProfileProvider.maybeWhen(orElse: () {
                return true;
              }, success: (userModel) {
                Navigator.of(context).pop(true);
                return false;
              });
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildHeader(context, ref),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      VerticalSpacer.xl,
                      UserImageWidget(imageUrl: userModel.photoUrl),
                      VerticalSpacer.exl,
                      VerticalSpacer.l,
                      updateUserProfileProvider.when(
                        initial: (userModel) =>
                            _buildBody(userModel, updateUserProfileProvider),
                        loading: () => const LoadingWidget(),
                        success: (userModel) =>
                            _buildBody(userModel, updateUserProfileProvider),
                        error: (error, failureType) =>
                            _buildBody(userModel, updateUserProfileProvider),
                      ),
                      VerticalSpacer.exl,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            ref
                .read(updateUserDetailProvider(userModel).notifier)
                .updateUserDetail(
              userId: ref.read(userNotifierProvider)!.uid,
              userData: {
                'mobileNumber': mobileNumber,
                'fullName': userName,
              },
            );
          },
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade500,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(UserModel userModel, UpdateProfileState state) {
    return Column(
      children: [
        LabelledTextFormField(
          label: 'Email',
          readOnly: true,
          value: userModel.email,
        ),
        VerticalSpacer.exl,
        LabelledTextFormField(
          label: 'Name',
          value: userModel.fullName,
          onTextChanged: (input) {
            userName = input;
          },
          errorText: state is UpdateProfileStateError &&
                  state.authStateFailureType ==
                      AuthStateFailureType.emptyUsername
              ? state.error
              : null,
        ),
        VerticalSpacer.exl,
        LabelledTextFormField(
          label: 'Mobile Number',
          keyboardType: TextInputType.number,
          value: userModel.mobileNumber,
          onTextChanged: (input) {
            debugPrint('input: $input');
            mobileNumber = input;
          },
          errorText: state is UpdateProfileStateError &&
                  state.authStateFailureType ==
                      AuthStateFailureType.invalidMobileNumber
              ? state.error
              : null,
        ),
      ],
    );
  }
}
