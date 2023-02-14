import 'package:ar_furniture_app/core/utils/enums.dart';

class FirebaseFailure {
  final FirebaseFailureEnum errorEnum;
  final String message;

  FirebaseFailure(this.errorEnum, this.message);

  static FirebaseFailure unknown({required String message}) {
    return FirebaseFailure(FirebaseFailureEnum.unknown, message);
  }

  static FirebaseFailure weakPassword =
      FirebaseFailure(FirebaseFailureEnum.weakPassword, 'Weak Password.');

  static FirebaseFailure emailAlreadyInUse = FirebaseFailure(
      FirebaseFailureEnum.emailAlreadyInUse, 'Email Already In Use.');

  static FirebaseFailure emailBadlyFormatted = FirebaseFailure(
      FirebaseFailureEnum.emailBadlyFormatted,
      'The email address is badly formatted.');

  static FirebaseFailure wrongPassword = FirebaseFailure(
      FirebaseFailureEnum.wrongPassword,
      'Wrong password provided for that user.');

  static FirebaseFailure userNotFound =
      FirebaseFailure(FirebaseFailureEnum.userNotFound, 'User not found.');

  static FirebaseFailure accountExistWithDifferentCredentials = FirebaseFailure(
    FirebaseFailureEnum.accountExistWithDifferentCredentials,
    'The account already exists with a different credential.',
  );

  static FirebaseFailure invalidCredentials = FirebaseFailure(
    FirebaseFailureEnum.invalidCredentials,
    'Error occurred while accessing credentials. Try again.',
  );
}
