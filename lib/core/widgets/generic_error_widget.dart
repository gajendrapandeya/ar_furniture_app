import 'package:flutter/material.dart';

class GenericErrorWidget extends StatelessWidget {
  final String error;
  final Function onBtnPressed;
  const GenericErrorWidget({
    Key? key,
    required this.error,
    required this.onBtnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          ElevatedButton.icon(
            onPressed: () => onBtnPressed(),
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
