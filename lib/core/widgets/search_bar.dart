import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSearchIconVisibleProvider =
    StateProvider.autoDispose<bool>((ref) => false);

/// A resuable Search Widget used in [LocationWidget], [TeamWidget], [LeagueWidget]
class SearchBar extends ConsumerWidget {
  const SearchBar({
    Key? key,
    required this.hintText,
    required this.onFieldChanged,
    required this.onClearPressed,
    required this.searchTextController,
  }) : super(key: key);

  final String hintText;
  final Function(String) onFieldChanged;
  final Function onClearPressed;
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSearchIconVisible = ref.watch(isSearchIconVisibleProvider);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: TextFormField(
        controller: searchTextController,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
        onChanged: (value) {
          ref
              .read(isSearchIconVisibleProvider.notifier)
              .update((state) => state = value.isNotEmpty);
          onFieldChanged(value);
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff949494),
            fontWeight: FontWeight.w300,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              if (searchTextController.text.isNotEmpty) {
                ref
                    .read(isSearchIconVisibleProvider.notifier)
                    .update((state) => state = false);
                onClearPressed();
              } else {
                context.showErrorSnackBar(
                    message: 'Please enter a search term');
              }
            },
            icon: Icon(
              isSearchIconVisible || searchTextController.text.isNotEmpty
                  ? CupertinoIcons.clear
                  : CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            bottom: 12.0,
            top: 12.0,
            right: 16.0,
          ),
        ),
      ),
    );
  }
}
