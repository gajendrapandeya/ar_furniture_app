import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.onItemClicked,
  });

  final String title;
  final IconData iconData;
  final VoidCallback onItemClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onItemClicked(),
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: const Icon(
        MdiIcons.chevronRight,
        color: Colors.black,
      ),
    );
  }
}
