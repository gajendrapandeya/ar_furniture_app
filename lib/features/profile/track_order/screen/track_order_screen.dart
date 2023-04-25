import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrderScreen extends ConsumerStatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TrackOrderScreenState();
}

class _TrackOrderScreenState extends ConsumerState<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('TrackOrder'),
    );
  }
}
