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
  emptyPassword,
  emptyOldPassword,
  emptyConfirmPassowrd,
  newPasswordAndConfirmNewPasswordNotSame,
  none,
}
