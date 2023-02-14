import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.url,
    this.isSvg = false,
    this.imageHeight = 200,
    this.imageWidth = 200,
    this.imageFit = BoxFit.cover,
  }) : super(key: key);
  final String url;
  final bool isSvg;
  final double imageWidth;
  final double imageHeight;
  final BoxFit imageFit;

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? SvgPicture.asset(
            url,
            width: imageWidth,
            height: imageHeight,
            fit: imageFit,
          )
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: imageFit,
                ),
              ),
            ),
            placeholder: (context, url) => const LoadingWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
