// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() saveSuccess,
    required TResult Function(List<CardDetail> cardList) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? saveSuccess,
    TResult? Function(List<CardDetail> cardList)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? saveSuccess,
    TResult Function(List<CardDetail> cardList)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardStateLoading value) loading,
    required TResult Function(CardStateSaveSuccess value) saveSuccess,
    required TResult Function(CardStateLoaded value) loaded,
    required TResult Function(CardStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardStateLoading value)? loading,
    TResult? Function(CardStateSaveSuccess value)? saveSuccess,
    TResult? Function(CardStateLoaded value)? loaded,
    TResult? Function(CardStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardStateLoading value)? loading,
    TResult Function(CardStateSaveSuccess value)? saveSuccess,
    TResult Function(CardStateLoaded value)? loaded,
    TResult Function(CardStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CardStateLoadingCopyWith<$Res> {
  factory _$$CardStateLoadingCopyWith(
          _$CardStateLoading value, $Res Function(_$CardStateLoading) then) =
      __$$CardStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CardStateLoadingCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$CardStateLoading>
    implements _$$CardStateLoadingCopyWith<$Res> {
  __$$CardStateLoadingCopyWithImpl(
      _$CardStateLoading _value, $Res Function(_$CardStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CardStateLoading implements CardStateLoading {
  const _$CardStateLoading();

  @override
  String toString() {
    return 'CardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CardStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() saveSuccess,
    required TResult Function(List<CardDetail> cardList) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? saveSuccess,
    TResult? Function(List<CardDetail> cardList)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? saveSuccess,
    TResult Function(List<CardDetail> cardList)? loaded,
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
    required TResult Function(CardStateLoading value) loading,
    required TResult Function(CardStateSaveSuccess value) saveSuccess,
    required TResult Function(CardStateLoaded value) loaded,
    required TResult Function(CardStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardStateLoading value)? loading,
    TResult? Function(CardStateSaveSuccess value)? saveSuccess,
    TResult? Function(CardStateLoaded value)? loaded,
    TResult? Function(CardStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardStateLoading value)? loading,
    TResult Function(CardStateSaveSuccess value)? saveSuccess,
    TResult Function(CardStateLoaded value)? loaded,
    TResult Function(CardStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CardStateLoading implements CardState {
  const factory CardStateLoading() = _$CardStateLoading;
}

/// @nodoc
abstract class _$$CardStateSaveSuccessCopyWith<$Res> {
  factory _$$CardStateSaveSuccessCopyWith(_$CardStateSaveSuccess value,
          $Res Function(_$CardStateSaveSuccess) then) =
      __$$CardStateSaveSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CardStateSaveSuccessCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$CardStateSaveSuccess>
    implements _$$CardStateSaveSuccessCopyWith<$Res> {
  __$$CardStateSaveSuccessCopyWithImpl(_$CardStateSaveSuccess _value,
      $Res Function(_$CardStateSaveSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CardStateSaveSuccess implements CardStateSaveSuccess {
  const _$CardStateSaveSuccess();

  @override
  String toString() {
    return 'CardState.saveSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CardStateSaveSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() saveSuccess,
    required TResult Function(List<CardDetail> cardList) loaded,
    required TResult Function(String error) error,
  }) {
    return saveSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? saveSuccess,
    TResult? Function(List<CardDetail> cardList)? loaded,
    TResult? Function(String error)? error,
  }) {
    return saveSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? saveSuccess,
    TResult Function(List<CardDetail> cardList)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (saveSuccess != null) {
      return saveSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardStateLoading value) loading,
    required TResult Function(CardStateSaveSuccess value) saveSuccess,
    required TResult Function(CardStateLoaded value) loaded,
    required TResult Function(CardStateError value) error,
  }) {
    return saveSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardStateLoading value)? loading,
    TResult? Function(CardStateSaveSuccess value)? saveSuccess,
    TResult? Function(CardStateLoaded value)? loaded,
    TResult? Function(CardStateError value)? error,
  }) {
    return saveSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardStateLoading value)? loading,
    TResult Function(CardStateSaveSuccess value)? saveSuccess,
    TResult Function(CardStateLoaded value)? loaded,
    TResult Function(CardStateError value)? error,
    required TResult orElse(),
  }) {
    if (saveSuccess != null) {
      return saveSuccess(this);
    }
    return orElse();
  }
}

abstract class CardStateSaveSuccess implements CardState {
  const factory CardStateSaveSuccess() = _$CardStateSaveSuccess;
}

/// @nodoc
abstract class _$$CardStateLoadedCopyWith<$Res> {
  factory _$$CardStateLoadedCopyWith(
          _$CardStateLoaded value, $Res Function(_$CardStateLoaded) then) =
      __$$CardStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CardDetail> cardList});
}

/// @nodoc
class __$$CardStateLoadedCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$CardStateLoaded>
    implements _$$CardStateLoadedCopyWith<$Res> {
  __$$CardStateLoadedCopyWithImpl(
      _$CardStateLoaded _value, $Res Function(_$CardStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardList = null,
  }) {
    return _then(_$CardStateLoaded(
      cardList: null == cardList
          ? _value._cardList
          : cardList // ignore: cast_nullable_to_non_nullable
              as List<CardDetail>,
    ));
  }
}

/// @nodoc

class _$CardStateLoaded implements CardStateLoaded {
  const _$CardStateLoaded({required final List<CardDetail> cardList})
      : _cardList = cardList;

  final List<CardDetail> _cardList;
  @override
  List<CardDetail> get cardList {
    if (_cardList is EqualUnmodifiableListView) return _cardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardList);
  }

  @override
  String toString() {
    return 'CardState.loaded(cardList: $cardList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardStateLoaded &&
            const DeepCollectionEquality().equals(other._cardList, _cardList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cardList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardStateLoadedCopyWith<_$CardStateLoaded> get copyWith =>
      __$$CardStateLoadedCopyWithImpl<_$CardStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() saveSuccess,
    required TResult Function(List<CardDetail> cardList) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(cardList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? saveSuccess,
    TResult? Function(List<CardDetail> cardList)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(cardList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? saveSuccess,
    TResult Function(List<CardDetail> cardList)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cardList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardStateLoading value) loading,
    required TResult Function(CardStateSaveSuccess value) saveSuccess,
    required TResult Function(CardStateLoaded value) loaded,
    required TResult Function(CardStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardStateLoading value)? loading,
    TResult? Function(CardStateSaveSuccess value)? saveSuccess,
    TResult? Function(CardStateLoaded value)? loaded,
    TResult? Function(CardStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardStateLoading value)? loading,
    TResult Function(CardStateSaveSuccess value)? saveSuccess,
    TResult Function(CardStateLoaded value)? loaded,
    TResult Function(CardStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CardStateLoaded implements CardState {
  const factory CardStateLoaded({required final List<CardDetail> cardList}) =
      _$CardStateLoaded;

  List<CardDetail> get cardList;
  @JsonKey(ignore: true)
  _$$CardStateLoadedCopyWith<_$CardStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardStateErrorCopyWith<$Res> {
  factory _$$CardStateErrorCopyWith(
          _$CardStateError value, $Res Function(_$CardStateError) then) =
      __$$CardStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CardStateErrorCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$CardStateError>
    implements _$$CardStateErrorCopyWith<$Res> {
  __$$CardStateErrorCopyWithImpl(
      _$CardStateError _value, $Res Function(_$CardStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CardStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardStateError implements CardStateError {
  const _$CardStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CardState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardStateErrorCopyWith<_$CardStateError> get copyWith =>
      __$$CardStateErrorCopyWithImpl<_$CardStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() saveSuccess,
    required TResult Function(List<CardDetail> cardList) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? saveSuccess,
    TResult? Function(List<CardDetail> cardList)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? saveSuccess,
    TResult Function(List<CardDetail> cardList)? loaded,
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
    required TResult Function(CardStateLoading value) loading,
    required TResult Function(CardStateSaveSuccess value) saveSuccess,
    required TResult Function(CardStateLoaded value) loaded,
    required TResult Function(CardStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardStateLoading value)? loading,
    TResult? Function(CardStateSaveSuccess value)? saveSuccess,
    TResult? Function(CardStateLoaded value)? loaded,
    TResult? Function(CardStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardStateLoading value)? loading,
    TResult Function(CardStateSaveSuccess value)? saveSuccess,
    TResult Function(CardStateLoaded value)? loaded,
    TResult Function(CardStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CardStateError implements CardState {
  const factory CardStateError({required final String error}) =
      _$CardStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$CardStateErrorCopyWith<_$CardStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
