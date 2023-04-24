// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderStateLoadingCopyWith<$Res> {
  factory _$$OrderStateLoadingCopyWith(
          _$OrderStateLoading value, $Res Function(_$OrderStateLoading) then) =
      __$$OrderStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateLoadingCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateLoading>
    implements _$$OrderStateLoadingCopyWith<$Res> {
  __$$OrderStateLoadingCopyWithImpl(
      _$OrderStateLoading _value, $Res Function(_$OrderStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateLoading implements OrderStateLoading {
  const _$OrderStateLoading();

  @override
  String toString() {
    return 'OrderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
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
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderStateLoading implements OrderState {
  const factory OrderStateLoading() = _$OrderStateLoading;
}

/// @nodoc
abstract class _$$OrderStateSuccessCopyWith<$Res> {
  factory _$$OrderStateSuccessCopyWith(
          _$OrderStateSuccess value, $Res Function(_$OrderStateSuccess) then) =
      __$$OrderStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderStateSuccessCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateSuccess>
    implements _$$OrderStateSuccessCopyWith<$Res> {
  __$$OrderStateSuccessCopyWithImpl(
      _$OrderStateSuccess _value, $Res Function(_$OrderStateSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderStateSuccess implements OrderStateSuccess {
  const _$OrderStateSuccess();

  @override
  String toString() {
    return 'OrderState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OrderStateSuccess implements OrderState {
  const factory OrderStateSuccess() = _$OrderStateSuccess;
}

/// @nodoc
abstract class _$$OrderStateFailureCopyWith<$Res> {
  factory _$$OrderStateFailureCopyWith(
          _$OrderStateFailure value, $Res Function(_$OrderStateFailure) then) =
      __$$OrderStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OrderStateFailureCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateFailure>
    implements _$$OrderStateFailureCopyWith<$Res> {
  __$$OrderStateFailureCopyWithImpl(
      _$OrderStateFailure _value, $Res Function(_$OrderStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$OrderStateFailure(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderStateFailure implements OrderStateFailure {
  const _$OrderStateFailure({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OrderState.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateFailureCopyWith<_$OrderStateFailure> get copyWith =>
      __$$OrderStateFailureCopyWithImpl<_$OrderStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderStateLoading value) loading,
    required TResult Function(OrderStateSuccess value) success,
    required TResult Function(OrderStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderStateLoading value)? loading,
    TResult? Function(OrderStateSuccess value)? success,
    TResult? Function(OrderStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderStateLoading value)? loading,
    TResult Function(OrderStateSuccess value)? success,
    TResult Function(OrderStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class OrderStateFailure implements OrderState {
  const factory OrderStateFailure({required final String error}) =
      _$OrderStateFailure;

  String get error;
  @JsonKey(ignore: true)
  _$$OrderStateFailureCopyWith<_$OrderStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
