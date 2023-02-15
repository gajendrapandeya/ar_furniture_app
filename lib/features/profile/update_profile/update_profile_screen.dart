import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('update profiel'),
      ),
    );
  }
}
