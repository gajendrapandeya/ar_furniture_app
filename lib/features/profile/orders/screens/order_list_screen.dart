// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/no_data_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/profile/orders/controller/order_controller.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:ar_furniture_app/features/profile/orders/widgets/order_list_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrderListScreen extends ConsumerStatefulWidget {
  const OrderListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderListScreenState();
}

class _OrderListScreenState extends ConsumerState<OrderListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    final userId = ref.read(userNotifierProvider)!.uid;
    _tabController =
        TabController(length: OrderStatus.values.length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(orderProvider.notifier).fetchOrder(
            orderStatus: OrderStatus.ordered.name,
            userId: userId,
          );
    });

    _listenTabState(userId);
  }

  void _listenTabState(String userId) {
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        ref.read(orderProvider.notifier).fetchOrder(
              orderStatus: OrderStatus.ordered.name,
              userId: userId,
            );
      } else if (_tabController.index == 1) {
        ref.read(orderProvider.notifier).fetchOrder(
              orderStatus: OrderStatus.inProcess.name,
              userId: userId,
            );
      } else if (_tabController.index == 2) {
        ref.read(orderProvider.notifier).fetchOrder(
              orderStatus: OrderStatus.delivered.name,
              userId: userId,
            );
      } else {
        ref.read(orderProvider.notifier).fetchOrder(
              orderStatus: OrderStatus.cancelled.name,
              userId: userId,
            );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: OrderStatus.values.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              MdiIcons.chevronLeft,
              size: 28,
            ),
          ),
          title: const Text(
            'My Orders',
          ),
          bottom: TabBar(
            controller: _tabController,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: const [
              Tab(
                text: 'Ordered',
              ),
              Tab(
                text: 'In Process',
              ),
              Tab(
                text: 'Delivered',
              ),
              Tab(
                text: 'Cancelled',
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: OrderStatus.values
              .mapIndexed((index, orderStatus) => _buildOrderList(orderStatus))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildOrderList(OrderStatus orderStatus) {
    return ref.watch(orderProvider).when(
        loading: () => const LoadingWidget(),
        success: (orders) {
          if (orders.isEmpty) {
            return const NoDataWidget(title: 'Nothing ordered yet.');
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            itemBuilder: ((context, index) => OrderListItem(
                  order: orders[index],
                )),
            separatorBuilder: ((context, index) => VerticalSpacer.xxl),
            itemCount: orders.length,
          );
        },
        failure: (error) => GenericErrorWidget(error: error));
  }
}
