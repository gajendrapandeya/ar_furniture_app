import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/not_logged_in_widget.dart';
import 'package:ar_furniture_app/features/auth/core/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishListScreen extends ConsumerStatefulWidget {
  const WishListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishListScreenState();
}

class _WishListScreenState extends ConsumerState<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ref.read(userNotifierProvider) != null
            ? const Center(
                child: Text('Wishlist'),
              )
            : NotLoggedInWidget(onLoginPressed: () {
                ref.read(authProvider.notifier).logout();
                Navigator.of(context)
                    .pushReplacementNamed(RouteConstants.loginRoute);
              }),
      ),
    );
  }
}
