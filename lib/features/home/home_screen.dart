import 'package:ar_furniture_app/core/widgets/bottom_nav_bar.dart';
import 'package:ar_furniture_app/features/cart/cart_screen.dart';
import 'package:ar_furniture_app/features/product/product_list/screens/product_list_screen.dart';
import 'package:ar_furniture_app/features/profile/core/screens/profile_screen.dart';
import 'package:ar_furniture_app/features/wishlist/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarCurrentIndexProvider = StateProvider(
  (ref) => 0,
);

/// The root page of the application.
/// Displays the bottom navigation bar, and pages based on
/// the selected index.
class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _pages = [
    const ProductListScreen(),
    const CartScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarCurrentIndexProvider);

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
