// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/features/home/home_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LabelItem {
  final String label;
  final IconData iconData;

  LabelItem({required this.label, required this.iconData});
}

final _navBarItems = [
  LabelItem(label: '', iconData: MdiIcons.homeOutline),
  LabelItem(label: '', iconData: MdiIcons.cart),
  LabelItem(label: '', iconData: MdiIcons.cardsHeartOutline),
  LabelItem(label: '', iconData: MdiIcons.accountOutline),
];

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarCurrentIndexProvider);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      onTap: (value) {
        ref
            .read(bottomNavBarCurrentIndexProvider.notifier)
            .update((state) => state = value);
      },
      items: _navBarItems
          .mapIndexed((index, item) => _buildBottomNavBarItem(
                label: item.label,
                iconData: item.iconData,
                isSelected: index == currentIndex,
                context: context,
              ))
          .toList(),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem({
    required String label,
    required IconData iconData,
    required bool isSelected,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Column(
        children: [
          Icon(
            iconData,
          ),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
