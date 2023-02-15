import 'dart:io';

import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/features/profile/core/controller/profile_controller.dart';
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
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    widget.imageUrl,
                  ),
                ),
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

  void _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
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
          );
        });
  }

  Future _pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        context.showErrorSnackBar(message: 'Please select an image');
      }
    });
  }

  Future _pickFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        _uploadFile(_photo!);
      } else {
        context.showErrorSnackBar(message: 'Please take a photo');
      }
    });
  }

  void _uploadFile(File photo) {
    ref.read(profileProvider.notifier).updateProfilePicture(photo: photo);
  }
}
