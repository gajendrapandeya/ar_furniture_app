import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentWidget extends ConsumerWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: const Text('Payment Widget'),
    );
  }
}
