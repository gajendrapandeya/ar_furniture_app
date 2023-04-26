import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/utils/snackbar_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSearchIconVisibleProvider =
    StateProvider.autoDispose<bool>((ref) => false);

/// A resuable Search Widget used in [LocationWidget], [TeamWidget], [LeagueWidget]

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({
    Key? key,
    required this.hintText,
    required this.onFieldChanged,
    this.searchBackgroundColor = Colors.white,
  }) : super(key: key);

  final String hintText;
  final Function(String) onFieldChanged;
  final Color searchBackgroundColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSearchIconVisible = ref.watch(isSearchIconVisibleProvider);
    return TextFormField(
      controller: _searchController,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.bold),
      onChanged: (value) {
        ref
            .read(isSearchIconVisibleProvider.notifier)
            .update((state) => state = value.isNotEmpty);
        widget.onFieldChanged(value);
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.searchBackgroundColor,
        hintStyle: const TextStyle(
          color: Color(0xff949494),
          fontWeight: FontWeight.w300,
        ),
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {
            if (_searchController.text.isNotEmpty) {
              ref
                  .read(isSearchIconVisibleProvider.notifier)
                  .update((state) => state = false);
              setState(() {
                _searchController.text = '';
              });
            } else {
              context.showErrorSnackBar(message: 'Please enter a search term');
            }
          },
          icon: Icon(
            isSearchIconVisible || _searchController.text.isNotEmpty
                ? CupertinoIcons.clear
                : CupertinoIcons.search,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: LightColor.platianGreen,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 16.0,
          bottom: 12.0,
          top: 12.0,
          right: 16.0,
        ),
      ),
    );
  }
}
