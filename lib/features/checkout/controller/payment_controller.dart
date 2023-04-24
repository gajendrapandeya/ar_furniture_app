import 'package:ar_furniture_app/features/checkout/service/payment_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentProvider =
    FutureProvider.family<dynamic, Map<String, dynamic>>((ref, metaData) async {
  final paymentService = ref.read(paymentServiceProvider);
  return paymentService.createPaymentIntent(
      amount: metaData['amount'], currency: metaData['currency']);
});
