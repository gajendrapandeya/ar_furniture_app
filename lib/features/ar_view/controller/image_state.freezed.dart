// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String imageUrl) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String imageUrl)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String imageUrl)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageStateLoading value) loading,
    required TResult Function(ImageStateSuccess value) success,
    required TResult Function(ImageStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageStateLoading value)? loading,
    TResult? Function(ImageStateSuccess value)? success,
    TResult? Function(ImageStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageStateLoading value)? loading,
    TResult Function(ImageStateSuccess value)? success,
    TResult Function(ImageStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageStateCopyWith<$Res> {
  factory $ImageStateCopyWith(
          ImageState value, $Res Function(ImageState) then) =
      _$ImageStateCopyWithImpl<$Res, ImageState>;
}

/// @nodoc
class _$ImageStateCopyWithImpl<$Res, $Val extends ImageState>
    implements $ImageStateCopyWith<$Res> {
  _$ImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImageStateLoadingCopyWith<$Res> {
  factory _$$ImageStateLoadingCopyWith(
          _$ImageStateLoading value, $Res Function(_$ImageStateLoading) then) =
      __$$ImageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImageStateLoadingCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageStateLoading>
    implements _$$ImageStateLoadingCopyWith<$Res> {
  __$$ImageStateLoadingCopyWithImpl(
      _$ImageStateLoading _value, $Res Function(_$ImageStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImageStateLoading implements ImageStateLoading {
  const _$ImageStateLoading();

  @override
  String toString() {
    return 'ImageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String imageUrl) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String imageUrl)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String imageUrl)? success,
    TResult Function(String error)? error,
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
    required TResult Function(ImageStateLoading value) loading,
    required TResult Function(ImageStateSuccess value) success,
    required TResult Function(ImageStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageStateLoading value)? loading,
    TResult? Function(ImageStateSuccess value)? success,
    TResult? Function(ImageStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageStateLoading value)? loading,
    TResult Function(ImageStateSuccess value)? success,
    TResult Function(ImageStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ImageStateLoading implements ImageState {
  const factory ImageStateLoading() = _$ImageStateLoading;
}

/// @nodoc
abstract class _$$ImageStateSuccessCopyWith<$Res> {
  factory _$$ImageStateSuccessCopyWith(
          _$ImageStateSuccess value, $Res Function(_$ImageStateSuccess) then) =
      __$$ImageStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String imageUrl});
}

/// @nodoc
class __$$ImageStateSuccessCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageStateSuccess>
    implements _$$ImageStateSuccessCopyWith<$Res> {
  __$$ImageStateSuccessCopyWithImpl(
      _$ImageStateSuccess _value, $Res Function(_$ImageStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
  }) {
    return _then(_$ImageStateSuccess(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageStateSuccess implements ImageStateSuccess {
  const _$ImageStateSuccess({required this.imageUrl});

  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ImageState.success(imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageStateSuccess &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageStateSuccessCopyWith<_$ImageStateSuccess> get copyWith =>
      __$$ImageStateSuccessCopyWithImpl<_$ImageStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String imageUrl) success,
    required TResult Function(String error) error,
  }) {
    return success(imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String imageUrl)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String imageUrl)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageStateLoading value) loading,
    required TResult Function(ImageStateSuccess value) success,
    required TResult Function(ImageStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageStateLoading value)? loading,
    TResult? Function(ImageStateSuccess value)? success,
    TResult? Function(ImageStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageStateLoading value)? loading,
    TResult Function(ImageStateSuccess value)? success,
    TResult Function(ImageStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ImageStateSuccess implements ImageState {
  const factory ImageStateSuccess({required final String imageUrl}) =
      _$ImageStateSuccess;

  String get imageUrl;
  @JsonKey(ignore: true)
  _$$ImageStateSuccessCopyWith<_$ImageStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageStateErrorCopyWith<$Res> {
  factory _$$ImageStateErrorCopyWith(
          _$ImageStateError value, $Res Function(_$ImageStateError) then) =
      __$$ImageStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ImageStateErrorCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$ImageStateError>
    implements _$$ImageStateErrorCopyWith<$Res> {
  __$$ImageStateErrorCopyWithImpl(
      _$ImageStateError _value, $Res Function(_$ImageStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ImageStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageStateError implements ImageStateError {
  const _$ImageStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ImageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageStateErrorCopyWith<_$ImageStateError> get copyWith =>
      __$$ImageStateErrorCopyWithImpl<_$ImageStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String imageUrl) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String imageUrl)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String imageUrl)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageStateLoading value) loading,
    required TResult Function(ImageStateSuccess value) success,
    required TResult Function(ImageStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageStateLoading value)? loading,
    TResult? Function(ImageStateSuccess value)? success,
    TResult? Function(ImageStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageStateLoading value)? loading,
    TResult Function(ImageStateSuccess value)? success,
    TResult Function(ImageStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImageStateError implements ImageState {
  const factory ImageStateError({required final String error}) =
      _$ImageStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$ImageStateErrorCopyWith<_$ImageStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
