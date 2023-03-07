import 'package:ar_furniture_app/core/utils/generic_utils.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArViewScreen extends StatefulWidget {
  const ArViewScreen({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  State<ArViewScreen> createState() => _ArViewScreenState();
}

class _ArViewScreenState extends State<ArViewScreen> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) async {
    final plane = hits.first;

    final file = await GenericUtils.urlToFile(widget.imageUrl);
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

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
