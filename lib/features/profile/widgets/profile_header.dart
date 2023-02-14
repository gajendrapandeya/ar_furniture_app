import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.userModel,
    required this.onEditPressed,
  });

  final UserModel userModel;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          color: Theme.of(context).colorScheme.primary,
        ),
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            alignment: Alignment.center,
            child: userModel.photoUrl.isEmpty
                ? Text(
                    'UL',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                : CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      userModel.photoUrl,
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: 25,
          left: MediaQuery.of(context).size.width * 0.38,
          child: Text(
            userModel.fullName,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Positioned(
          bottom: 6,
          left: MediaQuery.of(context).size.width * 0.35,
          child: Text(
            userModel.email,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.black.withOpacity(0.7),
                ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              MdiIcons.accountEdit,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
