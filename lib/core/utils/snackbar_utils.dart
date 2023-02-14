import 'package:flutter/material.dart';

/// Extension methods on [BuildContext] to show SnackBars
/// for purposes of showing success, error and info messages
extension SnackbarUtils on BuildContext {
  // Displays a SnackBar with a success message
  void showSuccessSnackBar(
      {required String message, int duration = 1, bool showFromTop = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message.classify(),
          textAlign: TextAlign.center,
          style: Theme.of(this).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
        ),
        margin: EdgeInsets.only(
          bottom: showFromTop ? MediaQuery.of(this).size.height * 0.8 : 10,
          left: showFromTop ? MediaQuery.of(this).size.width * 0.13 : 16.0,
          right: showFromTop ? MediaQuery.of(this).size.width * 0.18 : 16.0,
        ),
      ),
    );
  }

  // Displays a SnackBar with an error message
  void showErrorSnackBar(
      {required String message, int duration = 1, bool showFromTop = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(this).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        margin: EdgeInsets.only(
          bottom: showFromTop ? MediaQuery.of(this).size.height * 0.89 : 10,
          left: showFromTop ? MediaQuery.of(this).size.width * 0.13 : 16.0,
          right: showFromTop ? MediaQuery.of(this).size.width * 0.18 : 16.0,
        ),
      ),
    );
  }

  // Displays a SnackBar with an info message
  void showInfoSnackBar({required String message, int duration = 1}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        margin: const EdgeInsets.only(
          bottom: 10,
          left: 16.0,
          right: 16.0,
        ),
      ),
    );
  }

  // Calculates the Y offset of a particular widget
  double calculateOffset() {
    RenderBox? renderBox = findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return 0.0;
    }
    var offset = renderBox.localToGlobal(Offset.zero);

    return offset.dy;
  }
}

/// Extension methods on [String] to capitalize and get initials
extension StringUtils on String {
  String classify() {
    return this[0].toUpperCase() + substring(1);
  }

  String initials() {
    return split(' ').map((e) => e[0]).join();
  }
}
