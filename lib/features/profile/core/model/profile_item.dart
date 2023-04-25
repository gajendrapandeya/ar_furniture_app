import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileItem {
  final String title;
  final IconData iconData;

  ProfileItem({
    required this.title,
    required this.iconData,
  });
}

final List<ProfileItem> profileItems = [
  ProfileItem(title: 'My Orders', iconData: MdiIcons.gift),
  ProfileItem(title: 'Address Book', iconData: CupertinoIcons.placemark_fill),
  ProfileItem(title: 'Change Password', iconData: MdiIcons.key),
  ProfileItem(title: 'Saved Card', iconData: MdiIcons.cardAccountDetails),
];
