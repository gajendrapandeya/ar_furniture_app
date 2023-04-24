// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardDetail _$CardDetailFromJson(Map<String, dynamic> json) {
  return _CardDetail.fromJson(json);
}

/// @nodoc
mixin _$CardDetail {
  String get cardNumber => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;
  String get expiryDate => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardDetailCopyWith<CardDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDetailCopyWith<$Res> {
  factory $CardDetailCopyWith(
          CardDetail value, $Res Function(CardDetail) then) =
      _$CardDetailCopyWithImpl<$Res, CardDetail>;
  @useResult
  $Res call(
      {String cardNumber,
      String id,
      String cvv,
      String expiryDate,
      String zipCode});
}

/// @nodoc
class _$CardDetailCopyWithImpl<$Res, $Val extends CardDetail>
    implements $CardDetailCopyWith<$Res> {
  _$CardDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? id = null,
    Object? cvv = null,
    Object? expiryDate = null,
    Object? zipCode = null,
  }) {
    return _then(_value.copyWith(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardDetailCopyWith<$Res>
    implements $CardDetailCopyWith<$Res> {
  factory _$$_CardDetailCopyWith(
          _$_CardDetail value, $Res Function(_$_CardDetail) then) =
      __$$_CardDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cardNumber,
      String id,
      String cvv,
      String expiryDate,
      String zipCode});
}

/// @nodoc
class __$$_CardDetailCopyWithImpl<$Res>
    extends _$CardDetailCopyWithImpl<$Res, _$_CardDetail>
    implements _$$_CardDetailCopyWith<$Res> {
  __$$_CardDetailCopyWithImpl(
      _$_CardDetail _value, $Res Function(_$_CardDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? id = null,
    Object? cvv = null,
    Object? expiryDate = null,
    Object? zipCode = null,
  }) {
    return _then(_$_CardDetail(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardDetail implements _CardDetail {
  const _$_CardDetail(
      {required this.cardNumber,
      required this.id,
      required this.cvv,
      required this.expiryDate,
      required this.zipCode});

  factory _$_CardDetail.fromJson(Map<String, dynamic> json) =>
      _$$_CardDetailFromJson(json);

  @override
  final String cardNumber;
  @override
  final String id;
  @override
  final String cvv;
  @override
  final String expiryDate;
  @override
  final String zipCode;

  @override
  String toString() {
    return 'CardDetail(cardNumber: $cardNumber, id: $id, cvv: $cvv, expiryDate: $expiryDate, zipCode: $zipCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardDetail &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cardNumber, id, cvv, expiryDate, zipCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardDetailCopyWith<_$_CardDetail> get copyWith =>
      __$$_CardDetailCopyWithImpl<_$_CardDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardDetailToJson(
      this,
    );
  }
}

abstract class _CardDetail implements CardDetail {
  const factory _CardDetail(
      {required final String cardNumber,
      required final String id,
      required final String cvv,
      required final String expiryDate,
      required final String zipCode}) = _$_CardDetail;

  factory _CardDetail.fromJson(Map<String, dynamic> json) =
      _$_CardDetail.fromJson;

  @override
  String get cardNumber;
  @override
  String get id;
  @override
  String get cvv;
  @override
  String get expiryDate;
  @override
  String get zipCode;
  @override
  @JsonKey(ignore: true)
  _$$_CardDetailCopyWith<_$_CardDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
