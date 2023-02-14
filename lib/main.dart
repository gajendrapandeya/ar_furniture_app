import 'package:ar_furniture_app/core/constants/app_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/controllers/theme_controller.dart';
import 'package:ar_furniture_app/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Furniturly(),
    ),
  );
}

class Furniturly extends ConsumerWidget {
  const Furniturly({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ref.watch(themeProvider),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RouteConstants.loginRoute,
      ),
    );
  }
}
