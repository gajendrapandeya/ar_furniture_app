import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/features/profile/core/controller/profile_controller.dart';
import 'package:ar_furniture_app/features/profile/core/widgets/profile_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    if ((state.networkStateEnum == NetworkStateEnum.initial) ||
        (state.networkStateEnum == NetworkStateEnum.loading)) {
      return const ProfileLoadingWidget();
    } else if (state.networkStateEnum == NetworkStateEnum.success) {
      return _builldHeader(state.data as UserModel, context, ref);
    } else {
      return GenericErrorWidget(
          error: state.message ?? 'Unknown Error', onBtnPressed: () {});
    }
  }

  Widget _builldHeader(
      UserModel userModel, BuildContext context, WidgetRef ref) {
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
                    userModel.fullName.initials().toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                : SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(150),
                      ),
                      child: ImageWidget(
                        url: userModel.photoUrl,
                        imageHeight: 80,
                        imageWidth: 80,
                      ),
                    ),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                userModel.fullName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                userModel.email,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            transform: Matrix4.translationValues(0.0, 12.0, 0.0),
            child: IconButton(
              onPressed: () async {
                final result = await Navigator.of(context).pushNamed(
                  RouteConstants.updateProfileRoute,
                  arguments: userModel,
                );
                if (result != null && result == true) {
                  ref
                      .read(profileProvider.notifier)
                      .getUserData(uid: userModel.id);
                }
              },
              icon: const Icon(
                MdiIcons.pencilCircleOutline,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
