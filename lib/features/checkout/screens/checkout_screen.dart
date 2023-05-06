import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:ar_furniture_app/core/widgets/custom_app_bar.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_amount_controller.dart';
import 'package:ar_furniture_app/features/cart/controller/cart_controller.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:ar_furniture_app/features/checkout/controller/checkout_provider.dart';
import 'package:ar_furniture_app/features/checkout/model/checkout_model.dart';
import 'package:ar_furniture_app/features/checkout/widget/address_widget.dart';
import 'package:ar_furniture_app/features/checkout/widget/order_placed_widget.dart';
import 'package:ar_furniture_app/features/checkout/widget/payment_widget.dart';
import 'package:ar_furniture_app/features/profile/orders/controller/order_controller.dart';
import 'package:ar_furniture_app/features/profile/orders/controller/order_state.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/controller/card_controller.dart';
import 'package:ar_furniture_app/features/profile/track_order/model/order_tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final currentPageIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.cartProducts,
  });

  final List<Cart> cartProducts;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final PageController _pageController = PageController();

  final widgetList = [
    const AddressWidget(),
    PaymentWidget(),
    const OrderPlacedWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final checkoutProvider = ref.watch(checkoutNotifier);
    ref.listen<OrderState>(orderProvider, (prevState, currentState) {
      if (currentState is OrderStateLoading) {
        const LoadingWidget();
      } else if (currentState is OrderStateSuccess) {
        context.showSuccessSnackBar(message: 'Order placed successfully');
      } else if (currentState is OrderStateFailure) {
        context.showErrorSnackBar(message: currentState.error);
      }
    });
    return Scaffold(
      appBar: const CustomAppbar(title: 'Checkout'),
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
                itemBuilder: ((context, index) => widgetList[index]),
              ),
            ),
            VerticalSpacer.l,
            if (currentPageIndex <= 1)
              CustomElevatedButton(
                onButtonPressed: () {
                  if (checkoutProvider.selectedAddress == null) {
                    return context.showInfoSnackBar(
                        message: 'Please select at least one address first.');
                  }
                  if (currentPageIndex == 0) {
                    _pageController.jumpToPage(1);
                  }

                  if (currentPageIndex == 1) {
                    if (checkoutProvider.paymentId != null) {
                      _saveCard(checkoutProvider);
                    }
                    _removeCartProducts();
                    _createOrder(checkoutProvider);
                    _pageController.jumpToPage(2);
                  }
                },
                buttonText:
                    currentPageIndex == 0 ? 'Proceed To Payment' : 'Continue',
              ),
          ],
        ),
      ),
    );
  }

  void _saveCard(CheckoutModel checkoutProvider) {
    ref.read(cardNotifier.notifier).saveCard(
          cardDetail: checkoutProvider.cardDetail!,
          userId: ref.read(userNotifierProvider)!.uid,
        );
  }

  void _createOrder(CheckoutModel checkoutProvider) {
    ref.read(orderProvider.notifier).createOrder(
          order: ProductOrder(
            orderId: const Uuid().v1(),
            userId: ref.read(userNotifierProvider)!.uid,
            products: widget.cartProducts,
            totalAmount: ref.read(cartAmountProvider).total,
            userAddress: checkoutProvider.selectedAddress!,
            paymentId: checkoutProvider.paymentId,
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString(),
            orderStatus: OrderStatus.ordered,
            trackings: [
              OrderTracking(
                orderStatus: OrderStatus.ordered,
                updatedAt: DateTime.now().toString(),
              )
            ],
            paymentMethod: checkoutProvider.paymentMethod,
          ),
        );
  }

  void _removeCartProducts() {
    ref.read(cartProvider.notifier).removeAllProductsFromCart(
          userId: ref.read(userNotifierProvider)!.uid,
        );
  }
}
