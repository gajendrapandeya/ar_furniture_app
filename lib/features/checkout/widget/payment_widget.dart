// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:ar_furniture_app/core/model/radio_list_item.dart';
import 'package:ar_furniture_app/core/widgets/custom_radio_list.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_amount_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
    required this.onPaymentSuccessfull,
  });

  Map<String, dynamic>? paymentIntent;
  final VoidCallback onPaymentSuccessfull;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              makePayment(ref, context);
            }
          },
        ),
      ],
    );
  }

  Future<void> makePayment(WidgetRef ref, BuildContext context) async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent(
          ref.read(cartAmountProvider).total, 'NPR', ref);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  customFlow: true,
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {
      debugPrint('errP : $err');
      throw Exception(err);
    }
  }

  createPaymentIntent(int amount, String currency, WidgetRef ref) async {
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
      debugPrint('response: $response');
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: false,
        builder: (context) => SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Payment Successfull.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () => onPaymentSuccessfull(),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      debugPrint('$e');
    }
  }
}
