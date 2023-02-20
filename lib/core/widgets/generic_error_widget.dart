import 'package:flutter/material.dart';

class GenericErrorWidget extends StatelessWidget {
  final String error;
  const GenericErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
        ],
      ),
    );
  }
}
