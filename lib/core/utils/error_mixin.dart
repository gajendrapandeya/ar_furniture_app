import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/firebase_failure.dart';
import 'package:ar_furniture_app/core/utils/firestore_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin ErrorMixin {
  handleError(error) {
    // If firebase error
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'weak-password':
          throw CustomFirebaseException(
            failure: FirebaseFailure.weakPassword,
          );
        case 'invalid-email':
          throw CustomFirebaseException(
            failure: FirebaseFailure.emailBadlyFormatted,
          );
        case 'email-already-in-use':
          throw CustomFirebaseException(
            failure: FirebaseFailure.emailAlreadyInUse,
          );

        case 'wrong-password':
          throw CustomFirebaseException(
            failure: FirebaseFailure.wrongPassword,
          );
        case 'account-exists-with-different-credential':
          throw CustomFirebaseException(
            failure: FirebaseFailure.accountExistWithDifferentCredentials,
          );
        case 'user-not-found':
          throw CustomFirebaseException(
            failure: FirebaseFailure.userNotFound,
          );
        case 'invalid-credential':
          throw CustomFirebaseException(
            failure: FirebaseFailure.invalidCredentials,
          );

        default:
          throw Exception('Unknown error');
      }
    }
    // Handle DIO errors
    // else if (error is DioError) {
    //   if (error.type == DioErrorType.response) {
    //     final int statusCode = error.response!.statusCode ?? 503;
    //     if (statusCode == 503) {
    //       throw NetworkException(
    //         error: NetworkError.httpInternalServerError(
    //           message: error.message,
    //         ),
    //       );
    //     } else {
    //       throw NetworkException(
    //         error: NetworkError.httpUnknownError,
    //       );
    //     }
    //   }
    // }
    // Handle firestore errors
    else if (error is FirestoreException) {
      throw CustomFirebaseException(
        failure: FirebaseFailure.unknown(
          message: error.message,
        ),
      );
    }
    // handle network errors
    // else if (error is NetworkException) {
    //   throw NetworkException(
    //     error: NetworkError.httpUnknownError,
    //   );
    // } else {
    else {
      throw Exception("An unknown error has occured");
    }
  }
}
