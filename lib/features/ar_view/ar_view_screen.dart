import 'package:ar_furniture_app/core/utils/generic_utils.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/ar_view/controller/ar_recommended_controller.dart';
import 'package:ar_furniture_app/features/ar_view/controller/image_controller.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:ar_furniture_app/features/recommendation/controller/recommendation_controller.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArViewScreen extends ConsumerStatefulWidget {
  const ArViewScreen({required this.product, super.key});

  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArViewScreenState();
}

class _ArViewScreenState extends ConsumerState<ArViewScreen> {
  late ArCoreController arCoreController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(imageProvider.notifier).getImageUrl(
            imageUrl: widget.product.imageUrls.first,
            apiKey: dotenv.env['REMOVE_BG_API_KEY']!,
          );
      ref
          .read(recommendationProvider.notifier)
          .getRecommendedProducts(productId: widget.product.id);
    });
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(imageProvider).when(
            loading: () => const LoadingWidget(),
            success: (imageUrl) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  ref
                      .read(arRecommendedProvider.notifier)
                      .setImageUrl(imageUrl: imageUrl);
                },
              );
              return Stack(
                children: [
                  Positioned.fill(
                    child: ArCoreView(
                      onArCoreViewCreated: (controller) =>
                          _onArCoreViewCreated(controller),
                      enableTapRecognizer: true,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ref.watch(recommendationProvider).when(
                        initial: () => const LoadingWidget(),
                        loading: () => const LoadingWidget(),
                        loaded: (recommendedProducts) =>
                            _buildRecommendedProducts(recommendedProducts),
                        error: (error) => GenericErrorWidget(error: error)),
                  )
                ],
              );
            },
            error: (error) => GenericErrorWidget(error: error),
          ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(
    List<ArCoreHitTestResult> hits,
  ) async {
    final plane = hits.first;

    final file = await GenericUtils.urlToFile(
      ref.watch(arRecommendedProvider).imageUrl,
    );
    final bytes = file.readAsBytesSync();

    final imageItem = ArCoreNode(
      image: ArCoreImage(
        bytes: bytes,
        width: 600,
        height: 600,
      ),
      position: plane.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation: plane.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );

    arCoreController.addArCoreNodeWithAnchor(imageItem);
  }

  Widget _buildRecommendedProducts(List<Product> recommendedProducts) {
    final addedRecommendedProducts = [widget.product, ...recommendedProducts];
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
      ),
      alignment: Alignment.center,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) =>
            _buildRecommendedItem(addedRecommendedProducts, index)),
        separatorBuilder: ((context, index) => HorizontalSpacer.xs),
        itemCount: addedRecommendedProducts.length,
      ),
    );
  }

  Widget _buildRecommendedItem(
      List<Product> addedRecommendedProducts, int index) {
    final recommendedItemUrl = addedRecommendedProducts[index].imageUrls.first;
    final arRecommenderProvider = ref.watch(arRecommendedProvider);
    return InkWell(
      onTap: () {
        ref.read(arRecommendedProvider.notifier).setIndex(index: index);

        ref.read(imageProvider.notifier).getImageUrl(
              imageUrl: recommendedItemUrl,
              apiKey: dotenv.env['REMOVE_BG_API_KEY']!,
            );
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            border: Border.all(
          color: arRecommenderProvider.selectedIndex == index
              ? Colors.black
              : Colors.transparent,
        )),
        child: CachedNetworkImage(
          imageUrl: addedRecommendedProducts[index].imageUrls.first,
          fit: BoxFit.cover,
          width: 100,
        ),
      ),
    );
  }
}
