import 'package:ar_furniture_app/features/cart/cart_screen.dart';
import 'package:ar_furniture_app/features/product_list/product_list_screen.dart';
import 'package:ar_furniture_app/features/profile/profile_screen.dart';
import 'package:ar_furniture_app/features/wishlist/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: false,
      hideNavigationBar: false,
      backgroundColor: Colors.grey.shade50,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(2.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const ProductListScreen(),
      const CartScreen(),
      const WishListScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          MdiIcons.homeOutline,
        ),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Colors.grey.shade500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MdiIcons.cart),
        title: ("Cart"),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Colors.grey.shade500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MdiIcons.cardsHeartOutline),
        title: ("WishList"),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Colors.grey.shade500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(MdiIcons.accountOutline),
        title: ("Profile"),
        activeColorPrimary: Theme.of(context).colorScheme.tertiary,
        inactiveColorPrimary: Colors.grey.shade500,
      ),
    ];
  }
}
