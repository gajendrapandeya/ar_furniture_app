// ignore_for_file: depend_on_referenced_packages

import 'package:ar_furniture_app/core/constants/app_constants.dart';
import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/controllers/theme_controller.dart';
import 'package:ar_furniture_app/core/providers/storage_provider.dart';
import 'package:ar_furniture_app/core/router/app_router.dart';
import 'package:ar_furniture_app/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final token = await FirebaseAppCheck.instance.getToken();
  await http.post(
    Uri.parse('https://firebasestorage.googleapis.com/v0/b/images/'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const Furniturly(),
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
        navigatorKey: navigatorKey,
        title: AppConstants.appName,
        theme: ref.watch(themeProvider),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: ref.read(storageProvider).isOnboardingCompleted
            ? RouteConstants.homeRoute
            : RouteConstants.onboardingRoute,
      ),
    );
  }
}
