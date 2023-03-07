import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return MaterialApp(
      home: Scaffold(
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) async {
    final plane = hits.first;

    final ByteData textureBytes =
        await rootBundle.load('assets/images/sofa.png');

    final earthMaterial = ArCoreMaterial(
        color: Colors.transparent,
        textureBytes: textureBytes.buffer.asUint8List());

    final earthShape = ArCoreCube(
        materials: [earthMaterial], size: vector.Vector3(1.0, 1.0, 1.0));

    final earth = ArCoreNode(
        shape: earthShape,
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

    arCoreController.addArCoreNodeWithAnchor(earth);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
