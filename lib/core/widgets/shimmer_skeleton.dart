import 'package:flutter/material.dart';

class ShimmerSkeleton extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;
  const ShimmerSkeleton({
    Key? key,
    required this.height,
    this.width = double.infinity,
  })  : radius = null,
        super(key: key);

  const ShimmerSkeleton.circular({
    Key? key,
    required this.height,
    this.width = double.infinity,
    this.radius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
    );
  }
}
