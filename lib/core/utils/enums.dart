enum FirebaseFailureEnum {
  emailBadlyFormatted,
  weakPassword,
  wrongPassword,
  emailAlreadyInUse,
  userNotFound,
  invalidCredentials,
  accountExistWithDifferentCredentials,
  unknown,
}

enum AuthStateEnum {
  initial,
  loading,
  success,
  failure,
}

enum AuthStateFailureType {
  emptyUsername,
  emptyEmail,
  invalidMobileNumber,
  emptyPassword,
  emptyOldPassword,
  emptyConfirmPassowrd,
  newPasswordAndConfirmNewPasswordNotSame,
  none,
}

enum NetworkStateEnum {
  initial,
  loading,
  success,
  failure,
}
