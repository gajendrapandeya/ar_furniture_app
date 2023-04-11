import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/controller/address_controller.dart';
import 'package:ar_furniture_app/features/address/controller/tab_controller.dart';
import 'package:ar_furniture_app/features/address/model/tab_item.dart';
import 'package:ar_furniture_app/features/address/widgets/address_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressListScreen extends ConsumerStatefulWidget {
  const AddressListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddressListScreenState();
}

class _AddressListScreenState extends ConsumerState<AddressListScreen> {
  late List<TabItem> tabItems;

  @override
  Widget build(BuildContext context) {
    tabItems = ref.watch(tabsProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            MdiIcons.chevronLeft,
            size: 28,
          ),
        ),
        title: const Text(
          'Manage your addresses',
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: LightColor.platianGreen,
        icon: const Icon(
          MdiIcons.plus,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            32,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            RouteConstants.addAddressScreenRoute,
          );
        },
        label: const Text('Add Address'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                ),
                child: _buildTabBar(),
              ),
              VerticalSpacer.l,
              _buildSelectedTabWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      width: double.infinity,
      height: 42.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffEDEDED),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tabItems
            .map(
              (item) => Expanded(
                child: _buildItem(
                  isSelected: item.isSelected,
                  title: item.title,
                  onTap: () {
                    ref.read(tabsProvider.notifier).selectTab(item.id);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildItem({
    required bool isSelected,
    required String title,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            border: isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1.0,
                  )
                : null,
            borderRadius: BorderRadius.circular(
              isSelected ? 4.0 : 2.0,
            )),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                fontSize: 14.0,
                color: isSelected ? Colors.black : Colors.grey.shade600,
              ),
        ),
      ),
    );
  }

  Widget _buildSelectedTabWidget() {
    final selectedTab = ref.watch(tabsProvider.notifier).selectedTab;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(addressProvider.notifier).fetchAddresses(
            userId: ref.read(userNotifierProvider)!.uid,
            addressType: selectedTab.title,
          );
    });
    switch (selectedTab.id) {
      case 0:
        return AddressListWidget(selectedTabName: selectedTab.title);
      case 1:
        return AddressListWidget(selectedTabName: selectedTab.title);
      default:
        throw ArgumentError('Invalid');
    }
  }
}
