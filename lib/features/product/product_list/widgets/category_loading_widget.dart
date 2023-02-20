import 'package:ar_furniture_app/core/widgets/shimmer_loader.dart';
import 'package:ar_furniture_app/core/widgets/shimmer_skeleton.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

class CategoryLoadingWidget extends StatelessWidget {
  const CategoryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => const ShimmerSkeleton.circular(
              height: 10,
              radius: 8,
              width: 100,
            )),
        separatorBuilder: ((context, index) => HorizontalSpacer.l),
        itemCount: 6,
      ),
    );
  }
}
