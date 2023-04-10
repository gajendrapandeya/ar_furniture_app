// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemStateCopyWith<$Res> {
  factory $CartItemStateCopyWith(
          CartItemState value, $Res Function(CartItemState) then) =
      _$CartItemStateCopyWithImpl<$Res, CartItemState>;
}

/// @nodoc
class _$CartItemStateCopyWithImpl<$Res, $Val extends CartItemState>
    implements $CartItemStateCopyWith<$Res> {
  _$CartItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CartItemStateInitialCopyWith<$Res> {
  factory _$$CartItemStateInitialCopyWith(_$CartItemStateInitial value,
          $Res Function(_$CartItemStateInitial) then) =
      __$$CartItemStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartItemStateInitialCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateInitial>
    implements _$$CartItemStateInitialCopyWith<$Res> {
  __$$CartItemStateInitialCopyWithImpl(_$CartItemStateInitial _value,
      $Res Function(_$CartItemStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartItemStateInitial implements CartItemStateInitial {
  const _$CartItemStateInitial();

  @override
  String toString() {
    return 'CartItemState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartItemStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
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
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CartItemStateInitial implements CartItemState {
  const factory CartItemStateInitial() = _$CartItemStateInitial;
}

/// @nodoc
abstract class _$$CartItemStateLoadingCopyWith<$Res> {
  factory _$$CartItemStateLoadingCopyWith(_$CartItemStateLoading value,
          $Res Function(_$CartItemStateLoading) then) =
      __$$CartItemStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartItemStateLoadingCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateLoading>
    implements _$$CartItemStateLoadingCopyWith<$Res> {
  __$$CartItemStateLoadingCopyWithImpl(_$CartItemStateLoading _value,
      $Res Function(_$CartItemStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartItemStateLoading implements CartItemStateLoading {
  const _$CartItemStateLoading();

  @override
  String toString() {
    return 'CartItemState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartItemStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
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
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CartItemStateLoading implements CartItemState {
  const factory CartItemStateLoading() = _$CartItemStateLoading;
}

/// @nodoc
abstract class _$$CartItemStateSuccessCopyWith<$Res> {
  factory _$$CartItemStateSuccessCopyWith(_$CartItemStateSuccess value,
          $Res Function(_$CartItemStateSuccess) then) =
      __$$CartItemStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isInCart});
}

/// @nodoc
class __$$CartItemStateSuccessCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateSuccess>
    implements _$$CartItemStateSuccessCopyWith<$Res> {
  __$$CartItemStateSuccessCopyWithImpl(_$CartItemStateSuccess _value,
      $Res Function(_$CartItemStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInCart = null,
  }) {
    return _then(_$CartItemStateSuccess(
      isInCart: null == isInCart
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CartItemStateSuccess implements CartItemStateSuccess {
  const _$CartItemStateSuccess({required this.isInCart});

  @override
  final bool isInCart;

  @override
  String toString() {
    return 'CartItemState.success(isInCart: $isInCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemStateSuccess &&
            (identical(other.isInCart, isInCart) ||
                other.isInCart == isInCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemStateSuccessCopyWith<_$CartItemStateSuccess> get copyWith =>
      __$$CartItemStateSuccessCopyWithImpl<_$CartItemStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) {
    return success(isInCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) {
    return success?.call(isInCart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(isInCart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CartItemStateSuccess implements CartItemState {
  const factory CartItemStateSuccess({required final bool isInCart}) =
      _$CartItemStateSuccess;

  bool get isInCart;
  @JsonKey(ignore: true)
  _$$CartItemStateSuccessCopyWith<_$CartItemStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartItemStateErrorCopyWith<$Res> {
  factory _$$CartItemStateErrorCopyWith(_$CartItemStateError value,
          $Res Function(_$CartItemStateError) then) =
      __$$CartItemStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CartItemStateErrorCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateError>
    implements _$$CartItemStateErrorCopyWith<$Res> {
  __$$CartItemStateErrorCopyWithImpl(
      _$CartItemStateError _value, $Res Function(_$CartItemStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CartItemStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartItemStateError implements CartItemStateError {
  const _$CartItemStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CartItemState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemStateErrorCopyWith<_$CartItemStateError> get copyWith =>
      __$$CartItemStateErrorCopyWithImpl<_$CartItemStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
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
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CartItemStateError implements CartItemState {
  const factory CartItemStateError({required final String error}) =
      _$CartItemStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CartItemStateErrorCopyWith<_$CartItemStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartItemStateAddedToCartCopyWith<$Res> {
  factory _$$CartItemStateAddedToCartCopyWith(_$CartItemStateAddedToCart value,
          $Res Function(_$CartItemStateAddedToCart) then) =
      __$$CartItemStateAddedToCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartItemStateAddedToCartCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateAddedToCart>
    implements _$$CartItemStateAddedToCartCopyWith<$Res> {
  __$$CartItemStateAddedToCartCopyWithImpl(_$CartItemStateAddedToCart _value,
      $Res Function(_$CartItemStateAddedToCart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartItemStateAddedToCart implements CartItemStateAddedToCart {
  const _$CartItemStateAddedToCart();

  @override
  String toString() {
    return 'CartItemState.addedToCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemStateAddedToCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) {
    return addedToCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) {
    return addedToCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
    required TResult orElse(),
  }) {
    if (addedToCart != null) {
      return addedToCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) {
    return addedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) {
    return addedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) {
    if (addedToCart != null) {
      return addedToCart(this);
    }
    return orElse();
  }
}

abstract class CartItemStateAddedToCart implements CartItemState {
  const factory CartItemStateAddedToCart() = _$CartItemStateAddedToCart;
}

/// @nodoc
abstract class _$$CartItemStateRemovedFromCartCopyWith<$Res> {
  factory _$$CartItemStateRemovedFromCartCopyWith(
          _$CartItemStateRemovedFromCart value,
          $Res Function(_$CartItemStateRemovedFromCart) then) =
      __$$CartItemStateRemovedFromCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartItemStateRemovedFromCartCopyWithImpl<$Res>
    extends _$CartItemStateCopyWithImpl<$Res, _$CartItemStateRemovedFromCart>
    implements _$$CartItemStateRemovedFromCartCopyWith<$Res> {
  __$$CartItemStateRemovedFromCartCopyWithImpl(
      _$CartItemStateRemovedFromCart _value,
      $Res Function(_$CartItemStateRemovedFromCart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartItemStateRemovedFromCart implements CartItemStateRemovedFromCart {
  const _$CartItemStateRemovedFromCart();

  @override
  String toString() {
    return 'CartItemState.removedFromCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemStateRemovedFromCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool isInCart) success,
    required TResult Function(String error) error,
    required TResult Function() addedToCart,
    required TResult Function() removedFromCart,
  }) {
    return removedFromCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool isInCart)? success,
    TResult? Function(String error)? error,
    TResult? Function()? addedToCart,
    TResult? Function()? removedFromCart,
  }) {
    return removedFromCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool isInCart)? success,
    TResult Function(String error)? error,
    TResult Function()? addedToCart,
    TResult Function()? removedFromCart,
    required TResult orElse(),
  }) {
    if (removedFromCart != null) {
      return removedFromCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartItemStateInitial value) initial,
    required TResult Function(CartItemStateLoading value) loading,
    required TResult Function(CartItemStateSuccess value) success,
    required TResult Function(CartItemStateError value) error,
    required TResult Function(CartItemStateAddedToCart value) addedToCart,
    required TResult Function(CartItemStateRemovedFromCart value)
        removedFromCart,
  }) {
    return removedFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartItemStateInitial value)? initial,
    TResult? Function(CartItemStateLoading value)? loading,
    TResult? Function(CartItemStateSuccess value)? success,
    TResult? Function(CartItemStateError value)? error,
    TResult? Function(CartItemStateAddedToCart value)? addedToCart,
    TResult? Function(CartItemStateRemovedFromCart value)? removedFromCart,
  }) {
    return removedFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartItemStateInitial value)? initial,
    TResult Function(CartItemStateLoading value)? loading,
    TResult Function(CartItemStateSuccess value)? success,
    TResult Function(CartItemStateError value)? error,
    TResult Function(CartItemStateAddedToCart value)? addedToCart,
    TResult Function(CartItemStateRemovedFromCart value)? removedFromCart,
    required TResult orElse(),
  }) {
    if (removedFromCart != null) {
      return removedFromCart(this);
    }
    return orElse();
  }
}

abstract class CartItemStateRemovedFromCart implements CartItemState {
  const factory CartItemStateRemovedFromCart() = _$CartItemStateRemovedFromCart;
}
