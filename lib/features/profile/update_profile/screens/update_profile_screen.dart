import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/profile/update_profile/widgets/labeled_text_form_field.dart';
import 'package:ar_furniture_app/features/profile/update_profile/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildHeader(context),
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
                    LabelledTextFormField(
                      label: 'Email',
                      readOnly: true,
                      value: userModel.email,
                    ),
                    VerticalSpacer.exl,
                    LabelledTextFormField(
                      label: 'Name',
                      value: userModel.fullName,
                    ),
                    VerticalSpacer.exl,
                    const LabelledTextFormField(
                      label: 'Mobile Number',
                      keyboardType: TextInputType.number,
                    ),
                    VerticalSpacer.exl,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {},
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
}
