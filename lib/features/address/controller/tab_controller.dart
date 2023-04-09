import 'package:ar_furniture_app/features/address/model/tab_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabsProvider = StateNotifierProvider<TabController, List<TabItem>>(
  (ref) => TabController(),
);

/// Holds the [ChooseDate] or [ImFlexible] state in DateWidget
class TabController extends StateNotifier<List<TabItem>> {
  TabController() : super([]) {
    _init();
  }

  void _init() {
    state = [
      TabItem(
        title: 'Home',
        isSelected: true,
        id: 0,
      ),
      TabItem(
        title: 'Other',
        isSelected: false,
        id: 1,
      ),
    ];
  }

  // Given a tab id, sets it's [isSelected] property to true
  void selectTab(int id) {
    state = state.map((tabItem) {
      if (tabItem.id == id) {
        return tabItem.copyWith(isSelected: true);
      } else {
        return tabItem.copyWith(isSelected: false);
      }
    }).toList();
  }

  TabItem get selectedTab => state.firstWhere((element) => element.isSelected);
}
