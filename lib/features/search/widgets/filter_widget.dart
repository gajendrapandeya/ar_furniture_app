// ignore_for_file: must_be_immutable

import 'package:ar_furniture_app/core/model/check_list_item.dart';
import 'package:ar_furniture_app/core/widgets/check_list.dart';
import 'package:ar_furniture_app/core/widgets/custom_elevated_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterItems = [
  CheckListItem(id: 0, title: 'Price: Low to High', isChecked: false),
  CheckListItem(id: 1, title: 'Price: High to Low', isChecked: false),
  CheckListItem(id: 2, title: 'Top Rated', isChecked: false),
];

class FilterWidget extends ConsumerWidget {
  FilterWidget({
    super.key,
    required this.onApplyClicked,
  });

  final Function(String) onApplyClicked;
  String filterType = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: Text(
              'Sort By'.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
          ),
          VerticalSpacer.l,
          CheckList(
            items: filterItems,
            onItemChecked: (itemName) {
              filterType = itemName;
            },
          ),
          const Spacer(),
          CustomElevatedButton(
            onButtonPressed: () => onApplyClicked(filterType),
            buttonText: 'Apply',
          )
        ],
      ),
    );
  }
}
