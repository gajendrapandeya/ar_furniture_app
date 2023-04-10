// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WishListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> data) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> data)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishListStateInitial value) initial,
    required TResult Function(WishListStateLoading value) loading,
    required TResult Function(WishListStateSuccess value) success,
    required TResult Function(WishListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishListStateInitial value)? initial,
    TResult? Function(WishListStateLoading value)? loading,
    TResult? Function(WishListStateSuccess value)? success,
    TResult? Function(WishListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishListStateInitial value)? initial,
    TResult Function(WishListStateLoading value)? loading,
    TResult Function(WishListStateSuccess value)? success,
    TResult Function(WishListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishListStateCopyWith<$Res> {
  factory $WishListStateCopyWith(
          WishListState value, $Res Function(WishListState) then) =
      _$WishListStateCopyWithImpl<$Res, WishListState>;
}

/// @nodoc
class _$WishListStateCopyWithImpl<$Res, $Val extends WishListState>
    implements $WishListStateCopyWith<$Res> {
  _$WishListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WishListStateInitialCopyWith<$Res> {
  factory _$$WishListStateInitialCopyWith(_$WishListStateInitial value,
          $Res Function(_$WishListStateInitial) then) =
      __$$WishListStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WishListStateInitialCopyWithImpl<$Res>
    extends _$WishListStateCopyWithImpl<$Res, _$WishListStateInitial>
    implements _$$WishListStateInitialCopyWith<$Res> {
  __$$WishListStateInitialCopyWithImpl(_$WishListStateInitial _value,
      $Res Function(_$WishListStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WishListStateInitial implements WishListStateInitial {
  const _$WishListStateInitial();

  @override
  String toString() {
    return 'WishListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WishListStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> data) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> data)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishListStateInitial value) initial,
    required TResult Function(WishListStateLoading value) loading,
    required TResult Function(WishListStateSuccess value) success,
    required TResult Function(WishListStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishListStateInitial value)? initial,
    TResult? Function(WishListStateLoading value)? loading,
    TResult? Function(WishListStateSuccess value)? success,
    TResult? Function(WishListStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishListStateInitial value)? initial,
    TResult Function(WishListStateLoading value)? loading,
    TResult Function(WishListStateSuccess value)? success,
    TResult Function(WishListStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class WishListStateInitial implements WishListState {
  const factory WishListStateInitial() = _$WishListStateInitial;
}

/// @nodoc
abstract class _$$WishListStateLoadingCopyWith<$Res> {
  factory _$$WishListStateLoadingCopyWith(_$WishListStateLoading value,
          $Res Function(_$WishListStateLoading) then) =
      __$$WishListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WishListStateLoadingCopyWithImpl<$Res>
    extends _$WishListStateCopyWithImpl<$Res, _$WishListStateLoading>
    implements _$$WishListStateLoadingCopyWith<$Res> {
  __$$WishListStateLoadingCopyWithImpl(_$WishListStateLoading _value,
      $Res Function(_$WishListStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WishListStateLoading implements WishListStateLoading {
  const _$WishListStateLoading();

  @override
  String toString() {
    return 'WishListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WishListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> data) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> data)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> data)? success,
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
    required TResult Function(WishListStateInitial value) initial,
    required TResult Function(WishListStateLoading value) loading,
    required TResult Function(WishListStateSuccess value) success,
    required TResult Function(WishListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishListStateInitial value)? initial,
    TResult? Function(WishListStateLoading value)? loading,
    TResult? Function(WishListStateSuccess value)? success,
    TResult? Function(WishListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishListStateInitial value)? initial,
    TResult Function(WishListStateLoading value)? loading,
    TResult Function(WishListStateSuccess value)? success,
    TResult Function(WishListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WishListStateLoading implements WishListState {
  const factory WishListStateLoading() = _$WishListStateLoading;
}

/// @nodoc
abstract class _$$WishListStateSuccessCopyWith<$Res> {
  factory _$$WishListStateSuccessCopyWith(_$WishListStateSuccess value,
          $Res Function(_$WishListStateSuccess) then) =
      __$$WishListStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> data});
}

/// @nodoc
class __$$WishListStateSuccessCopyWithImpl<$Res>
    extends _$WishListStateCopyWithImpl<$Res, _$WishListStateSuccess>
    implements _$$WishListStateSuccessCopyWith<$Res> {
  __$$WishListStateSuccessCopyWithImpl(_$WishListStateSuccess _value,
      $Res Function(_$WishListStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WishListStateSuccess(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$WishListStateSuccess implements WishListStateSuccess {
  const _$WishListStateSuccess({required final List<Product> data})
      : _data = data;

  final List<Product> _data;
  @override
  List<Product> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'WishListState.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishListStateSuccess &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WishListStateSuccessCopyWith<_$WishListStateSuccess> get copyWith =>
      __$$WishListStateSuccessCopyWithImpl<_$WishListStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> data) success,
    required TResult Function(String error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> data)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WishListStateInitial value) initial,
    required TResult Function(WishListStateLoading value) loading,
    required TResult Function(WishListStateSuccess value) success,
    required TResult Function(WishListStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishListStateInitial value)? initial,
    TResult? Function(WishListStateLoading value)? loading,
    TResult? Function(WishListStateSuccess value)? success,
    TResult? Function(WishListStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishListStateInitial value)? initial,
    TResult Function(WishListStateLoading value)? loading,
    TResult Function(WishListStateSuccess value)? success,
    TResult Function(WishListStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WishListStateSuccess implements WishListState {
  const factory WishListStateSuccess({required final List<Product> data}) =
      _$WishListStateSuccess;

  List<Product> get data;
  @JsonKey(ignore: true)
  _$$WishListStateSuccessCopyWith<_$WishListStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WishListStateErrorCopyWith<$Res> {
  factory _$$WishListStateErrorCopyWith(_$WishListStateError value,
          $Res Function(_$WishListStateError) then) =
      __$$WishListStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$WishListStateErrorCopyWithImpl<$Res>
    extends _$WishListStateCopyWithImpl<$Res, _$WishListStateError>
    implements _$$WishListStateErrorCopyWith<$Res> {
  __$$WishListStateErrorCopyWithImpl(
      _$WishListStateError _value, $Res Function(_$WishListStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$WishListStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WishListStateError implements WishListStateError {
  const _$WishListStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'WishListState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishListStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WishListStateErrorCopyWith<_$WishListStateError> get copyWith =>
      __$$WishListStateErrorCopyWithImpl<_$WishListStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> data) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> data)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> data)? success,
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
    required TResult Function(WishListStateInitial value) initial,
    required TResult Function(WishListStateLoading value) loading,
    required TResult Function(WishListStateSuccess value) success,
    required TResult Function(WishListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WishListStateInitial value)? initial,
    TResult? Function(WishListStateLoading value)? loading,
    TResult? Function(WishListStateSuccess value)? success,
    TResult? Function(WishListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WishListStateInitial value)? initial,
    TResult Function(WishListStateLoading value)? loading,
    TResult Function(WishListStateSuccess value)? success,
    TResult Function(WishListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WishListStateError implements WishListState {
  const factory WishListStateError({required final String error}) =
      _$WishListStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$WishListStateErrorCopyWith<_$WishListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
