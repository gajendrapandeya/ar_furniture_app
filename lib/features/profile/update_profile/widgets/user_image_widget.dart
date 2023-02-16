import 'dart:io';

import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/enums.dart';
import 'package:ar_furniture_app/core/utils/network_state.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/image_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/features/profile/update_profile/controller/upload_photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserImageWidget extends ConsumerStatefulWidget {
  const UserImageWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserImageWidgetState();
}

class _UserImageWidgetState extends ConsumerState<UserImageWidget> {
  final ImagePicker _picker = ImagePicker();
  late NetworkState _uploadPhotoState;

  @override
  Widget build(BuildContext context) {
    _uploadPhotoState = ref.watch(uploadPhotoProvider);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
          ),
          alignment: Alignment.center,
          child: widget.imageUrl.isEmpty
              ? const Icon(
                  MdiIcons.faceManProfile,
                  size: 60,
                  color: Colors.black,
                )
              : _buildPhoto(),
        ),
        Positioned(
          bottom: 2,
          right: 0,
          child: InkWell(
            onTap: () => _showPicker(context),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
              child: const Icon(
                MdiIcons.camera,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPhoto() {
    if (_uploadPhotoState.networkStateEnum == NetworkStateEnum.initial) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: ImageWidget(url: widget.imageUrl),
      );
    } else if (_uploadPhotoState.networkStateEnum == NetworkStateEnum.loading) {
      return const LoadingWidget();
    } else if (_uploadPhotoState.networkStateEnum == NetworkStateEnum.success) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: ImageWidget(url: _uploadPhotoState.data as String),
      );
    } else {
      return const Icon(
        MdiIcons.alert,
        color: Colors.red,
      );
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      _pickFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _pickFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final photo = File(pickedFile.path);
      _uploadFile(file: photo);
    } else {
      if (mounted) {
        context.showErrorSnackBar(message: 'Please select an image');
      }
    }
  }

  Future _pickFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final photo = File(pickedFile.path);
      _uploadFile(file: photo);
    } else {
      if (mounted) {
        context.showErrorSnackBar(message: 'Please select an image');
      }
    }
  }

  void _uploadFile({required File file}) {
    ref
        .read(uploadPhotoProvider.notifier)
        .uploadPhoto(userId: ref.read(userNotifierProvider)!.uid, file: file);
  }
}
