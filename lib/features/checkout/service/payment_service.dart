import 'dart:convert';

import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService();
});

class PaymentService with ErrorMixin {
  Future<dynamic> createPaymentIntent(
      {required String amount, required String currency}) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
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
      return json.decode(response.body);
    } catch (e) {
      debugPrint('paymentError: $e');
      handleError(e);
    }
  }
}
