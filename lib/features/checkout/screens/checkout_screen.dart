import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/checkout/widget/address_widget.dart';
import 'package:ar_furniture_app/features/checkout/widget/order_placed_widget.dart';
import 'package:ar_furniture_app/features/checkout/widget/payment_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final isAddressSelectedProvider = StateProvider<bool>((ref) {
  return false;
});

final currentPageIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final PageController _pageController = PageController();
  final _widgetList = [
    const AddressWidget(),
    PaymentWidget(),
    const OrderPlacedWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(MdiIcons.chevronLeft),
        ),
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (pageIndex) {
                  ref
                      .read(currentPageIndexProvider.notifier)
                      .update((state) => state = pageIndex);
                },
                controller: _pageController,
                itemBuilder: ((context, index) => _widgetList[index]),
              ),
            ),
            VerticalSpacer.l,
            if (currentPageIndex <= 1)
              CustomElevatedButton(
                onButtonPressed: () {
                  if (!ref.read(isAddressSelectedProvider)) {
                    return context.showInfoSnackBar(
                        message: 'Please select at least one address first.');
                  }
                  if (currentPageIndex == 0) {
                    _pageController.jumpToPage(1);
                  }
                },
                buttonText:
                    currentPageIndex == 0 ? 'Proceed To Payment' : 'Make a pay',
              ),
          ],
        ),
      ),
    );
  }
}
