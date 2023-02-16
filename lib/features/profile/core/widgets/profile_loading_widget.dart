import 'package:ar_furniture_app/core/widgets/shimmer_loader.dart';
import 'package:ar_furniture_app/core/widgets/shimmer_skeleton.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Align(
                alignment: Alignment.center,
                child: ShimmerSkeleton.circular(
                  height: 100,
                  width: 100,
                  radius: 100,
                ),
              ),
              VerticalSpacer.l,
              ShimmerSkeleton(
                height: 8,
                width: 120,
              ),
              VerticalSpacer.s,
              ShimmerSkeleton(
                height: 6,
                width: 200,
              ),
            ],
          )),
    );
  }
}
