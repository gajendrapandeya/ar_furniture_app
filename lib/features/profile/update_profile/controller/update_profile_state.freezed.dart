// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) initial,
    required TResult Function() loading,
    required TResult Function(UserModel userModel) success,
    required TResult Function(
            String error, AuthStateFailureType authStateFailureType)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel userModel)? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel userModel)? success,
    TResult? Function(String error, AuthStateFailureType authStateFailureType)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? initial,
    TResult Function()? loading,
    TResult Function(UserModel userModel)? success,
    TResult Function(String error, AuthStateFailureType authStateFailureType)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateProfileStateInitial value) initial,
    required TResult Function(UpdateProfileStateLoading value) loading,
    required TResult Function(UpdateProfileStateSucces value) success,
    required TResult Function(UpdateProfileStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateProfileStateInitial value)? initial,
    TResult? Function(UpdateProfileStateLoading value)? loading,
    TResult? Function(UpdateProfileStateSucces value)? success,
    TResult? Function(UpdateProfileStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateProfileStateInitial value)? initial,
    TResult Function(UpdateProfileStateLoading value)? loading,
    TResult Function(UpdateProfileStateSucces value)? success,
    TResult Function(UpdateProfileStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileStateCopyWith(
          UpdateProfileState value, $Res Function(UpdateProfileState) then) =
      _$UpdateProfileStateCopyWithImpl<$Res, UpdateProfileState>;
}

/// @nodoc
class _$UpdateProfileStateCopyWithImpl<$Res, $Val extends UpdateProfileState>
    implements $UpdateProfileStateCopyWith<$Res> {
  _$UpdateProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateProfileStateInitialCopyWith<$Res> {
  factory _$$UpdateProfileStateInitialCopyWith(
          _$UpdateProfileStateInitial value,
          $Res Function(_$UpdateProfileStateInitial) then) =
      __$$UpdateProfileStateInitialCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userModel});
}

/// @nodoc
class __$$UpdateProfileStateInitialCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res, _$UpdateProfileStateInitial>
    implements _$$UpdateProfileStateInitialCopyWith<$Res> {
  __$$UpdateProfileStateInitialCopyWithImpl(_$UpdateProfileStateInitial _value,
      $Res Function(_$UpdateProfileStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
  }) {
    return _then(_$UpdateProfileStateInitial(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UpdateProfileStateInitial implements UpdateProfileStateInitial {
  const _$UpdateProfileStateInitial({required this.userModel});

  @override
  final UserModel userModel;

  @override
  String toString() {
    return 'UpdateProfileState.initial(userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileStateInitial &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileStateInitialCopyWith<_$UpdateProfileStateInitial>
      get copyWith => __$$UpdateProfileStateInitialCopyWithImpl<
          _$UpdateProfileStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) initial,
    required TResult Function() loading,
    required TResult Function(UserModel userModel) success,
    required TResult Function(
            String error, AuthStateFailureType authStateFailureType)
        error,
  }) {
    return initial(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel userModel)? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel userModel)? success,
    TResult? Function(String error, AuthStateFailureType authStateFailureType)?
        error,
  }) {
    return initial?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? initial,
    TResult Function()? loading,
    TResult Function(UserModel userModel)? success,
    TResult Function(String error, AuthStateFailureType authStateFailureType)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateProfileStateInitial value) initial,
    required TResult Function(UpdateProfileStateLoading value) loading,
    required TResult Function(UpdateProfileStateSucces value) success,
    required TResult Function(UpdateProfileStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateProfileStateInitial value)? initial,
    TResult? Function(UpdateProfileStateLoading value)? loading,
    TResult? Function(UpdateProfileStateSucces value)? success,
    TResult? Function(UpdateProfileStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateProfileStateInitial value)? initial,
    TResult Function(UpdateProfileStateLoading value)? loading,
    TResult Function(UpdateProfileStateSucces value)? success,
    TResult Function(UpdateProfileStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileStateInitial implements UpdateProfileState {
  const factory UpdateProfileStateInitial(
      {required final UserModel userModel}) = _$UpdateProfileStateInitial;

  UserModel get userModel;
  @JsonKey(ignore: true)
  _$$UpdateProfileStateInitialCopyWith<_$UpdateProfileStateInitial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileStateLoadingCopyWith<$Res> {
  factory _$$UpdateProfileStateLoadingCopyWith(
          _$UpdateProfileStateLoading value,
          $Res Function(_$UpdateProfileStateLoading) then) =
      __$$UpdateProfileStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateProfileStateLoadingCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res, _$UpdateProfileStateLoading>
    implements _$$UpdateProfileStateLoadingCopyWith<$Res> {
  __$$UpdateProfileStateLoadingCopyWithImpl(_$UpdateProfileStateLoading _value,
      $Res Function(_$UpdateProfileStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateProfileStateLoading implements UpdateProfileStateLoading {
  const _$UpdateProfileStateLoading();

  @override
  String toString() {
    return 'UpdateProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) initial,
    required TResult Function() loading,
    required TResult Function(UserModel userModel) success,
    required TResult Function(
            String error, AuthStateFailureType authStateFailureType)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel userModel)? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel userModel)? success,
    TResult? Function(String error, AuthStateFailureType authStateFailureType)?
        error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? initial,
    TResult Function()? loading,
    TResult Function(UserModel userModel)? success,
    TResult Function(String error, AuthStateFailureType authStateFailureType)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateProfileStateInitial value) initial,
    required TResult Function(UpdateProfileStateLoading value) loading,
    required TResult Function(UpdateProfileStateSucces value) success,
    required TResult Function(UpdateProfileStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateProfileStateInitial value)? initial,
    TResult? Function(UpdateProfileStateLoading value)? loading,
    TResult? Function(UpdateProfileStateSucces value)? success,
    TResult? Function(UpdateProfileStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateProfileStateInitial value)? initial,
    TResult Function(UpdateProfileStateLoading value)? loading,
    TResult Function(UpdateProfileStateSucces value)? success,
    TResult Function(UpdateProfileStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileStateLoading implements UpdateProfileState {
  const factory UpdateProfileStateLoading() = _$UpdateProfileStateLoading;
}

/// @nodoc
abstract class _$$UpdateProfileStateSuccesCopyWith<$Res> {
  factory _$$UpdateProfileStateSuccesCopyWith(_$UpdateProfileStateSucces value,
          $Res Function(_$UpdateProfileStateSucces) then) =
      __$$UpdateProfileStateSuccesCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userModel});
}

/// @nodoc
class __$$UpdateProfileStateSuccesCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res, _$UpdateProfileStateSucces>
    implements _$$UpdateProfileStateSuccesCopyWith<$Res> {
  __$$UpdateProfileStateSuccesCopyWithImpl(_$UpdateProfileStateSucces _value,
      $Res Function(_$UpdateProfileStateSucces) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
  }) {
    return _then(_$UpdateProfileStateSucces(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UpdateProfileStateSucces implements UpdateProfileStateSucces {
  const _$UpdateProfileStateSucces({required this.userModel});

  @override
  final UserModel userModel;

  @override
  String toString() {
    return 'UpdateProfileState.success(userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileStateSucces &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileStateSuccesCopyWith<_$UpdateProfileStateSucces>
      get copyWith =>
          __$$UpdateProfileStateSuccesCopyWithImpl<_$UpdateProfileStateSucces>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) initial,
    required TResult Function() loading,
    required TResult Function(UserModel userModel) success,
    required TResult Function(
            String error, AuthStateFailureType authStateFailureType)
        error,
  }) {
    return success(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel userModel)? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel userModel)? success,
    TResult? Function(String error, AuthStateFailureType authStateFailureType)?
        error,
  }) {
    return success?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? initial,
    TResult Function()? loading,
    TResult Function(UserModel userModel)? success,
    TResult Function(String error, AuthStateFailureType authStateFailureType)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateProfileStateInitial value) initial,
    required TResult Function(UpdateProfileStateLoading value) loading,
    required TResult Function(UpdateProfileStateSucces value) success,
    required TResult Function(UpdateProfileStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateProfileStateInitial value)? initial,
    TResult? Function(UpdateProfileStateLoading value)? loading,
    TResult? Function(UpdateProfileStateSucces value)? success,
    TResult? Function(UpdateProfileStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateProfileStateInitial value)? initial,
    TResult Function(UpdateProfileStateLoading value)? loading,
    TResult Function(UpdateProfileStateSucces value)? success,
    TResult Function(UpdateProfileStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileStateSucces implements UpdateProfileState {
  const factory UpdateProfileStateSucces({required final UserModel userModel}) =
      _$UpdateProfileStateSucces;

  UserModel get userModel;
  @JsonKey(ignore: true)
  _$$UpdateProfileStateSuccesCopyWith<_$UpdateProfileStateSucces>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileStateErrorCopyWith<$Res> {
  factory _$$UpdateProfileStateErrorCopyWith(_$UpdateProfileStateError value,
          $Res Function(_$UpdateProfileStateError) then) =
      __$$UpdateProfileStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, AuthStateFailureType authStateFailureType});
}

/// @nodoc
class __$$UpdateProfileStateErrorCopyWithImpl<$Res>
    extends _$UpdateProfileStateCopyWithImpl<$Res, _$UpdateProfileStateError>
    implements _$$UpdateProfileStateErrorCopyWith<$Res> {
  __$$UpdateProfileStateErrorCopyWithImpl(_$UpdateProfileStateError _value,
      $Res Function(_$UpdateProfileStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? authStateFailureType = null,
  }) {
    return _then(_$UpdateProfileStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      authStateFailureType: null == authStateFailureType
          ? _value.authStateFailureType
          : authStateFailureType // ignore: cast_nullable_to_non_nullable
              as AuthStateFailureType,
    ));
  }
}

/// @nodoc

class _$UpdateProfileStateError implements UpdateProfileStateError {
  const _$UpdateProfileStateError(
      {required this.error, required this.authStateFailureType});

  @override
  final String error;
  @override
  final AuthStateFailureType authStateFailureType;

  @override
  String toString() {
    return 'UpdateProfileState.error(error: $error, authStateFailureType: $authStateFailureType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileStateError &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.authStateFailureType, authStateFailureType) ||
                other.authStateFailureType == authStateFailureType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, authStateFailureType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileStateErrorCopyWith<_$UpdateProfileStateError> get copyWith =>
      __$$UpdateProfileStateErrorCopyWithImpl<_$UpdateProfileStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel userModel) initial,
    required TResult Function() loading,
    required TResult Function(UserModel userModel) success,
    required TResult Function(
            String error, AuthStateFailureType authStateFailureType)
        error,
  }) {
    return error(this.error, authStateFailureType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel userModel)? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel userModel)? success,
    TResult? Function(String error, AuthStateFailureType authStateFailureType)?
        error,
  }) {
    return error?.call(this.error, authStateFailureType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel userModel)? initial,
    TResult Function()? loading,
    TResult Function(UserModel userModel)? success,
    TResult Function(String error, AuthStateFailureType authStateFailureType)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, authStateFailureType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateProfileStateInitial value) initial,
    required TResult Function(UpdateProfileStateLoading value) loading,
    required TResult Function(UpdateProfileStateSucces value) success,
    required TResult Function(UpdateProfileStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateProfileStateInitial value)? initial,
    TResult? Function(UpdateProfileStateLoading value)? loading,
    TResult? Function(UpdateProfileStateSucces value)? success,
    TResult? Function(UpdateProfileStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateProfileStateInitial value)? initial,
    TResult Function(UpdateProfileStateLoading value)? loading,
    TResult Function(UpdateProfileStateSucces value)? success,
    TResult Function(UpdateProfileStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileStateError implements UpdateProfileState {
  const factory UpdateProfileStateError(
          {required final String error,
          required final AuthStateFailureType authStateFailureType}) =
      _$UpdateProfileStateError;

  String get error;
  AuthStateFailureType get authStateFailureType;
  @JsonKey(ignore: true)
  _$$UpdateProfileStateErrorCopyWith<_$UpdateProfileStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
