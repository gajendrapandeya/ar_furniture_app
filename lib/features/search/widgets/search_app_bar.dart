import 'package:ar_furniture_app/core/widgets/search_bar.dart' as search_bar;
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.onChanged,
    required this.onFilterClicked,
    required this.onClearClicked,
  });

  final Function(String) onChanged;
  final VoidCallback onFilterClicked;
  final VoidCallback onClearClicked;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                MdiIcons.chevronLeftCircle,
                color: Colors.black,
                size: 26,
              ),
            ),
            HorizontalSpacer.l,
            Expanded(
              child: search_bar.SearchBar(
                hintText: 'Search for a product',
                onFieldChanged: (userInput) => onChanged(userInput),
                searchBackgroundColor: Colors.grey.shade100,
                onClearClicked: () => onClearClicked(),
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              onPressed: () => onFilterClicked(),
              icon: const Icon(
                MdiIcons.filterVariant,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
