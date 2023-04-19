// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:ar_furniture_app/features/cart/controller/cart_amount_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentWidget extends ConsumerWidget {
  PaymentWidget({super.key});

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: const Text('Make Payment'),
      onPressed: () async {
        await makePayment(ref, context);
      },
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
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                    ],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        debugPrint('error: $error');
        throw Exception(error);
      });
    } on StripeException catch (e) {
      debugPrint('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('$e');
    }
  }
}
