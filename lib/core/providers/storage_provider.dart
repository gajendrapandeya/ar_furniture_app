import 'package:ar_furniture_app/core/service/storage_service.dart';
import 'package:ar_furniture_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageProvider = Provider<StorageService>((ref) {
  return StorageService(
    ref.watch(sharedPreferencesProvider),
  );
});
