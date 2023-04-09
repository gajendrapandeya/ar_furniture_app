import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/not_logged_in_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/auth/core/controller/authentication_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cartProvider.notifier).fetchProductsInCart(
            userId: ref.read(userNotifierProvider)?.uid ?? '',
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ref.read(userNotifierProvider) != null
            ? _buildCartList()
            : NotLoggedInWidget(onLoginPressed: () {
                ref.read(authProvider.notifier).logout();
                Navigator.of(context)
                    .pushReplacementNamed(RouteConstants.loginRoute);
              }),
      ),
    );
  }

  Widget _buildCartList() {
    return ref.watch(cartProvider).maybeWhen(
          orElse: () => Container(),
          loading: () => const CircularProgressIndicator(),
          success: (cartList) => ListView.separated(
            itemBuilder: ((ctx, index) => Text(cartList[index].name)),
            separatorBuilder: ((ctx, index) => VerticalSpacer.l),
            itemCount: cartList.length,
          ),
        );
  }
}
