// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:ar_furniture_app/core/model/radio_list_item.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_radio_list.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_amount_controller.dart';
import 'package:ar_furniture_app/features/checkout/controller/checkout_provider.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uuid/uuid.dart';

final List<RadioListItem> radioItems = [
  RadioListItem(
    id: 0,
    title: 'Credit Card',
    subTitle: 'Pay with mastercard or visa card',
    iconData: MdiIcons.cardAccountDetails,
  ),
  RadioListItem(
    id: 1,
    title: 'Cash On Delivery',
    subTitle: 'Pay when you receive item',
    iconData: MdiIcons.cash,
  )
];

class PaymentWidget extends ConsumerWidget {
  PaymentWidget({
    super.key,
  });

  Map<String, dynamic>? _paymentIntent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(checkoutNotifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment method',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
        ),
        VerticalSpacer.xs,
        Text(
          'Select one of the payment method',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
        ),
        VerticalSpacer.exl,
        CustomRadioList(
          items: radioItems,
          onItemChecked: (selectedIndex) {
            if (selectedIndex == 0) {
              _makePayment(ref, context);
              ref
                  .read(checkoutNotifier.notifier)
                  .setPaymentMethod(paymentMethod: ProductPaymentMethod.stripe);
            } else {
              ref
                  .read(checkoutNotifier.notifier)
                  .setPaymentMethod(paymentMethod: ProductPaymentMethod.cod);
            }
          },
        ),
      ],
    );
  }

  Future<void> _makePayment(WidgetRef ref, BuildContext context) async {
    try {
      //STEP 1: Create Payment Intent
      _paymentIntent = await _createPaymentIntent(
          ref.read(cartAmountProvider).total, 'NPR', ref);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  customFlow: true,
                  paymentIntentClientSecret: _paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      _displayPaymentSheet(context, ref);
    } catch (err) {
      debugPrint('errP : $err');
      throw Exception(err);
    }
  }

  _createPaymentIntent(int amount, String currency, WidgetRef ref) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': ref.read(cartAmountProvider).total.toString(),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      ref
          .read(checkoutNotifier.notifier)
          .setPaymentId(paymentId: jsonDecode(response.body)['id']);
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  _displayPaymentSheet(BuildContext context, WidgetRef ref) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ref.read(checkoutNotifier.notifier).setCardDetails(
            cardDetail: CardDetail(
                id: const Uuid().v1(),
                cardNumber: '4242 4242 4242 4242',
                cvv: '123',
                expiryDate: '04/32',
                zipCode: '12345'),
          );
      context.showSuccessSnackBar(message: 'Payment Successfull');
    } catch (e) {
      debugPrint('$e');
    }
  }
}
