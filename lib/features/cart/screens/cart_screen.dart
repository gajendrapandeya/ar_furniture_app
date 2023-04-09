import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/generic_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/not_logged_in_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/auth/core/controller/authentication_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_amount_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_state.dart';
import 'package:ar_furniture_app/features/cart/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  int _subTotal = 0;
  double _shippingAndTaxesCost = 0;
  int _total = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(cartProvider) is! CartStateSuccess) {
        ref.read(cartProvider.notifier).fetchProductsInCart(
              userId: ref.read(userNotifierProvider)?.uid ?? '',
            );
      }
    });
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
          success: (cartList) {
            _subTotal = cartList.fold(
                0, (previous, current) => previous + current.price);

            _shippingAndTaxesCost = cartList.fold(
              0,
              (previousValue, element) =>
                  previousValue + (80 + (13 / 100) * element.price),
            );
            _total = (_shippingAndTaxesCost + _subTotal).toInt();

            return cartList.isEmpty
                ? const NoDataWidget(
                    title: 'Nothing found in your cart.',
                    subTitle: 'Try adding some items into your cart first.',
                  )
                : Stack(
                    children: [
                      Positioned.fill(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 28,
                          ),
                          itemBuilder: ((ctx, index) {
                            return CartListItem(
                              cart: cartList[index],
                              onAddPressed: (count) {
                                _subTotal =
                                    _subTotal + cartList[index].price * count;
                                ref
                                    .read(cartAmountProvider.notifier)
                                    .setSubtotal(_subTotal);
                              },
                              onMinusPressed: (count) {
                                _subTotal =
                                    _subTotal - cartList[index].price * count;
                                ref
                                    .read(cartAmountProvider.notifier)
                                    .setSubtotal(_subTotal);
                              },
                              onDeletePressed: () {},
                            );
                          }),
                          separatorBuilder: ((ctx, index) => VerticalSpacer.xl),
                          itemCount: cartList.length,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ref.read(cartProvider) is CartStateSuccess
                            ? _buildTotalAndCheckout()
                            : Container(),
                      )
                    ],
                  );
          },
        );
  }

  Container _buildTotalAndCheckout() {
    final cartAmount = ref.watch(cartAmountProvider);
    // ref.read(cartAmountProvider.notifier).setSubtotal(_subTotal);
    // ref
    //     .read(cartAmountProvider.notifier)
    //     .setShippingAndTaxesCost(_shippingAndTaxesCost);
    // ref.read(cartAmountProvider.notifier).setTotal(_total);
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: .5,
            offset: Offset(2, 2),
          ),
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Column(
        children: [
          _buildPriceItem(
            'Subtotal',
            GenericUtils.formatAmount(cartAmount.subTotal),
          ),
          VerticalSpacer.l,
          _buildPriceItem(
            'Shipping And Taxes',
            GenericUtils.formatAmount(cartAmount.shippingAndTaxesCost.toInt()),
          ),
          VerticalSpacer.l,
          const Divider(),
          VerticalSpacer.l,
          _buildPriceItem(
            'Total'.toUpperCase(),
            GenericUtils.formatAmount(
              cartAmount.total,
            ),
            true,
          ),
          VerticalSpacer.xxxl,
          CustomElevatedButton(onButtonPressed: () {}, buttonText: 'Checkout')
        ],
      ),
    );
  }

  Widget _buildPriceItem(String text, String amount, [bool isBold = false]) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
        ),
        const Spacer(),
        Text(
          amount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
        )
      ],
    );
  }
}
