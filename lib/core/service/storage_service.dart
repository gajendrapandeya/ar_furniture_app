import 'package:ar_furniture_app/core/constants/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _sharedPreferences;

  StorageService(this._sharedPreferences);

  void setOnboardingCompleted() async {
    _sharedPreferences.setBool(StorageConstants.onboardingKey, true);
  }

  bool get isOnboardingCompleted =>
      _sharedPreferences.getBool(StorageConstants.onboardingKey) ?? false;
}
