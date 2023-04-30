import 'package:ar_furniture_app/core/utils/generic_utils.dart';
import 'package:ar_furniture_app/core/widgets/generic_error_widget.dart';
import 'package:ar_furniture_app/core/widgets/loading_widget.dart';
import 'package:ar_furniture_app/features/ar_view/controller/image_controller.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArViewScreen extends ConsumerStatefulWidget {
  const ArViewScreen({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArViewScreenState();
}

class _ArViewScreenState extends ConsumerState<ArViewScreen> {
  late ArCoreController arCoreController;
  late String _removedBgUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(imageProvider.notifier).getImageUrl(
            imageUrl: widget.imageUrl,
            apiKey: dotenv.env['REMOVE_BG_API_KEY']!,
          );
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
              _removedBgUrl = imageUrl;
              return ArCoreView(
                onArCoreViewCreated: (controller) =>
                    _onArCoreViewCreated(controller),
                enableTapRecognizer: true,
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
      _removedBgUrl,
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
}
