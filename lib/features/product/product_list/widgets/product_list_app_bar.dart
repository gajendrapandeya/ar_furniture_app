import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: AppBar(
        centerTitle: true,
        title: Text(
          'Furniturly',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(RouteConstants.searchScreenRoute),
            icon: const Icon(
              CupertinoIcons.search,
              size: 26,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
