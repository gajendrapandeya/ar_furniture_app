import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          MdiIcons.chevronLeft,
          size: 28,
        ),
      ),
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
