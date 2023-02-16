// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/features/home/home_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavBarItem {
  final String label;
  final IconData iconData;

  BottomNavBarItem({required this.label, required this.iconData});
}

final _navBarItems = [
  BottomNavBarItem(label: '', iconData: MdiIcons.homeOutline),
  BottomNavBarItem(label: '', iconData: MdiIcons.cart),
  BottomNavBarItem(label: '', iconData: MdiIcons.cardsHeartOutline),
  BottomNavBarItem(label: '', iconData: MdiIcons.accountOutline),
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
      backgroundColor: Colors.red,
      type: BottomNavigationBarType.shifting,
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
      backgroundColor: Colors.grey.shade50,
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
