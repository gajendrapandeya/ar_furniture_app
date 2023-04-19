import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderPlacedWidget extends ConsumerWidget {
  const OrderPlacedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: const Text('Order Placed'),
    );
  }
}
