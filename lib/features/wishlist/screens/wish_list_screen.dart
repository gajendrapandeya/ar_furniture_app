import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/not_logged_in_widget.dart';
import 'package:ar_furniture_app/features/auth/core/controller/authentication_controller.dart';
import 'package:ar_furniture_app/features/product/product_list/widgets/product_list_item_widget.dart';
import 'package:ar_furniture_app/features/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishListScreen extends ConsumerStatefulWidget {
  const WishListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishListScreenState();
}

class _WishListScreenState extends ConsumerState<WishListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wishListProvider.notifier).fetchProductsInWishList(
            userId: ref.read(userNotifierProvider)?.uid ?? '',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ref.read(userNotifierProvider) != null
            ? _buildWishlist()
            : NotLoggedInWidget(onLoginPressed: () {
                ref.read(authProvider.notifier).logout();
                Navigator.of(context)
                    .pushReplacementNamed(RouteConstants.loginRoute);
              }),
      ),
    );
  }

  Widget _buildWishlist() {
    return ref.watch(wishListProvider).maybeWhen(
          orElse: () => const Text('Helo'),
          loading: () => const LoadingWidget(),
          success: (products) => products.isEmpty
              ? const NoDataWidget(
                  title: 'Nothing found in your wishlist.',
                  subTitle: 'Try adding some product into your wishlist first.',
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 28,
                  ),
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RouteConstants.productDetailRoute,
                            arguments: products[index],
                          );
                        },
                        child: ProductListItem(
                          key: ValueKey(products[index].id),
                          product: products[index],
                          isFromWishlist: true,
                        ),
                      )),
                ),
        );
  }
}
