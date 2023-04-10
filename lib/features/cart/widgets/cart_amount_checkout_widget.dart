import 'package:ar_furniture_app/core/utils/generic_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_amount_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartAmountCheckoutWidget extends ConsumerWidget {
  const CartAmountCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAmount = ref.watch(cartAmountProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
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
          _buildPriceItem('Subtotal',
              GenericUtils.formatAmount(cartAmount.subTotal), context),
          VerticalSpacer.s,
          _buildPriceItem(
              'Shipping And Taxes',
              GenericUtils.formatAmount(
                  cartAmount.shippingAndTaxesCost.toInt()),
              context),
          VerticalSpacer.s,
          const Divider(),
          VerticalSpacer.s,
          _buildPriceItem(
            'Total'.toUpperCase(),
            GenericUtils.formatAmount(
              cartAmount.total,
            ),
            context,
            true,
          ),
          VerticalSpacer.m,
          CustomElevatedButton(onButtonPressed: () {}, buttonText: 'Checkout')
        ],
      ),
    );
  }

  Widget _buildPriceItem(String text, String amount, BuildContext context,
      [bool isBold = false]) {
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
