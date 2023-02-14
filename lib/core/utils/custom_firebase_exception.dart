import 'package:ar_furniture_app/core/utils/firebase_failure.dart';

class CustomFirebaseException implements Exception {
  final FirebaseFailure failure;

  CustomFirebaseException({required this.failure});
}
