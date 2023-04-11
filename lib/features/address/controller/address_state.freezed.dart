// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Address> addressList) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Address> addressList)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Address> addressList)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddressStateLoading value) loading,
    required TResult Function(AddressStateSuccess value) success,
    required TResult Function(AddressStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddressStateLoading value)? loading,
    TResult? Function(AddressStateSuccess value)? success,
    TResult? Function(AddressStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddressStateLoading value)? loading,
    TResult Function(AddressStateSuccess value)? success,
    TResult Function(AddressStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddressStateLoadingCopyWith<$Res> {
  factory _$$AddressStateLoadingCopyWith(_$AddressStateLoading value,
          $Res Function(_$AddressStateLoading) then) =
      __$$AddressStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddressStateLoadingCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateLoading>
    implements _$$AddressStateLoadingCopyWith<$Res> {
  __$$AddressStateLoadingCopyWithImpl(
      _$AddressStateLoading _value, $Res Function(_$AddressStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddressStateLoading implements AddressStateLoading {
  const _$AddressStateLoading();

  @override
  String toString() {
    return 'AddressState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddressStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Address> addressList) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Address> addressList)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Address> addressList)? success,
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
    required TResult Function(AddressStateLoading value) loading,
    required TResult Function(AddressStateSuccess value) success,
    required TResult Function(AddressStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddressStateLoading value)? loading,
    TResult? Function(AddressStateSuccess value)? success,
    TResult? Function(AddressStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddressStateLoading value)? loading,
    TResult Function(AddressStateSuccess value)? success,
    TResult Function(AddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddressStateLoading implements AddressState {
  const factory AddressStateLoading() = _$AddressStateLoading;
}

/// @nodoc
abstract class _$$AddressStateSuccessCopyWith<$Res> {
  factory _$$AddressStateSuccessCopyWith(_$AddressStateSuccess value,
          $Res Function(_$AddressStateSuccess) then) =
      __$$AddressStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Address> addressList});
}

/// @nodoc
class __$$AddressStateSuccessCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateSuccess>
    implements _$$AddressStateSuccessCopyWith<$Res> {
  __$$AddressStateSuccessCopyWithImpl(
      _$AddressStateSuccess _value, $Res Function(_$AddressStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = null,
  }) {
    return _then(_$AddressStateSuccess(
      addressList: null == addressList
          ? _value._addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ));
  }
}

/// @nodoc

class _$AddressStateSuccess implements AddressStateSuccess {
  const _$AddressStateSuccess({required final List<Address> addressList})
      : _addressList = addressList;

  final List<Address> _addressList;
  @override
  List<Address> get addressList {
    if (_addressList is EqualUnmodifiableListView) return _addressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressList);
  }

  @override
  String toString() {
    return 'AddressState.success(addressList: $addressList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateSuccess &&
            const DeepCollectionEquality()
                .equals(other._addressList, _addressList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_addressList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateSuccessCopyWith<_$AddressStateSuccess> get copyWith =>
      __$$AddressStateSuccessCopyWithImpl<_$AddressStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Address> addressList) success,
    required TResult Function(String error) error,
  }) {
    return success(addressList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Address> addressList)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(addressList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Address> addressList)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(addressList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddressStateLoading value) loading,
    required TResult Function(AddressStateSuccess value) success,
    required TResult Function(AddressStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddressStateLoading value)? loading,
    TResult? Function(AddressStateSuccess value)? success,
    TResult? Function(AddressStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddressStateLoading value)? loading,
    TResult Function(AddressStateSuccess value)? success,
    TResult Function(AddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AddressStateSuccess implements AddressState {
  const factory AddressStateSuccess(
      {required final List<Address> addressList}) = _$AddressStateSuccess;

  List<Address> get addressList;
  @JsonKey(ignore: true)
  _$$AddressStateSuccessCopyWith<_$AddressStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressStateErrorCopyWith<$Res> {
  factory _$$AddressStateErrorCopyWith(
          _$AddressStateError value, $Res Function(_$AddressStateError) then) =
      __$$AddressStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AddressStateErrorCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateError>
    implements _$$AddressStateErrorCopyWith<$Res> {
  __$$AddressStateErrorCopyWithImpl(
      _$AddressStateError _value, $Res Function(_$AddressStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AddressStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddressStateError implements AddressStateError {
  const _$AddressStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AddressState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateErrorCopyWith<_$AddressStateError> get copyWith =>
      __$$AddressStateErrorCopyWithImpl<_$AddressStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Address> addressList) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Address> addressList)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Address> addressList)? success,
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
    required TResult Function(AddressStateLoading value) loading,
    required TResult Function(AddressStateSuccess value) success,
    required TResult Function(AddressStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddressStateLoading value)? loading,
    TResult? Function(AddressStateSuccess value)? success,
    TResult? Function(AddressStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddressStateLoading value)? loading,
    TResult Function(AddressStateSuccess value)? success,
    TResult Function(AddressStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddressStateError implements AddressState {
  const factory AddressStateError({required final String error}) =
      _$AddressStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$AddressStateErrorCopyWith<_$AddressStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
