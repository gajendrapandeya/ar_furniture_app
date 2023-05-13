import 'package:ar_furniture_app/core/widgets/shimmer_loader.dart';
import 'package:ar_furniture_app/core/widgets/shimmer_skeleton.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

class ProductsLoadingWidget extends StatelessWidget {
  const ProductsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildLoader(context), _buildLoader(context)],
        ),
        VerticalSpacer.l,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildLoader(context), _buildLoader(context)],
        ),
      ],
    ));
  }

  Column _buildLoader(BuildContext context) {
    return Column(
      children: [
        ShimmerSkeleton.circular(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.4,
          radius: 8,
        ),
        VerticalSpacer.l,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerSkeleton(
              height: 10,
              width: 80,
            ),
            HorizontalSpacer.exl,
            ShimmerSkeleton.circular(
              height: 18,
              width: 18,
              radius: 8,
            ),
          ],
        ),
        VerticalSpacer.l,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerSkeleton(
              height: 10,
              width: 80,
            ),
            HorizontalSpacer.exl,
            ShimmerSkeleton.circular(
              height: 18,
              width: 18,
              radius: 8,
            ),
          ],
        )
      ],
    );
  }
}
