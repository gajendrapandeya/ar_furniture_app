// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutModel {
  Address? get selectedAddress => throw _privateConstructorUsedError;
  ProductPaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  CardDetail? get cardDetail => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutModelCopyWith<CheckoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutModelCopyWith<$Res> {
  factory $CheckoutModelCopyWith(
          CheckoutModel value, $Res Function(CheckoutModel) then) =
      _$CheckoutModelCopyWithImpl<$Res, CheckoutModel>;
  @useResult
  $Res call(
      {Address? selectedAddress,
      ProductPaymentMethod paymentMethod,
      CardDetail? cardDetail,
      String? paymentId});

  $AddressCopyWith<$Res>? get selectedAddress;
  $CardDetailCopyWith<$Res>? get cardDetail;
}

/// @nodoc
class _$CheckoutModelCopyWithImpl<$Res, $Val extends CheckoutModel>
    implements $CheckoutModelCopyWith<$Res> {
  _$CheckoutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAddress = freezed,
    Object? paymentMethod = null,
    Object? cardDetail = freezed,
    Object? paymentId = freezed,
  }) {
    return _then(_value.copyWith(
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as ProductPaymentMethod,
      cardDetail: freezed == cardDetail
          ? _value.cardDetail
          : cardDetail // ignore: cast_nullable_to_non_nullable
              as CardDetail?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get selectedAddress {
    if (_value.selectedAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.selectedAddress!, (value) {
      return _then(_value.copyWith(selectedAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDetailCopyWith<$Res>? get cardDetail {
    if (_value.cardDetail == null) {
      return null;
    }

    return $CardDetailCopyWith<$Res>(_value.cardDetail!, (value) {
      return _then(_value.copyWith(cardDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CheckoutModelCopyWith<$Res>
    implements $CheckoutModelCopyWith<$Res> {
  factory _$$_CheckoutModelCopyWith(
          _$_CheckoutModel value, $Res Function(_$_CheckoutModel) then) =
      __$$_CheckoutModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Address? selectedAddress,
      ProductPaymentMethod paymentMethod,
      CardDetail? cardDetail,
      String? paymentId});

  @override
  $AddressCopyWith<$Res>? get selectedAddress;
  @override
  $CardDetailCopyWith<$Res>? get cardDetail;
}

/// @nodoc
class __$$_CheckoutModelCopyWithImpl<$Res>
    extends _$CheckoutModelCopyWithImpl<$Res, _$_CheckoutModel>
    implements _$$_CheckoutModelCopyWith<$Res> {
  __$$_CheckoutModelCopyWithImpl(
      _$_CheckoutModel _value, $Res Function(_$_CheckoutModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAddress = freezed,
    Object? paymentMethod = null,
    Object? cardDetail = freezed,
    Object? paymentId = freezed,
  }) {
    return _then(_$_CheckoutModel(
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as ProductPaymentMethod,
      cardDetail: freezed == cardDetail
          ? _value.cardDetail
          : cardDetail // ignore: cast_nullable_to_non_nullable
              as CardDetail?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CheckoutModel extends _CheckoutModel {
  const _$_CheckoutModel(
      {required this.selectedAddress,
      this.paymentMethod = ProductPaymentMethod.cod,
      required this.cardDetail,
      required this.paymentId})
      : super._();

  @override
  final Address? selectedAddress;
  @override
  @JsonKey()
  final ProductPaymentMethod paymentMethod;
  @override
  final CardDetail? cardDetail;
  @override
  final String? paymentId;

  @override
  String toString() {
    return 'CheckoutModel(selectedAddress: $selectedAddress, paymentMethod: $paymentMethod, cardDetail: $cardDetail, paymentId: $paymentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutModel &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.cardDetail, cardDetail) ||
                other.cardDetail == cardDetail) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedAddress, paymentMethod, cardDetail, paymentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutModelCopyWith<_$_CheckoutModel> get copyWith =>
      __$$_CheckoutModelCopyWithImpl<_$_CheckoutModel>(this, _$identity);
}

abstract class _CheckoutModel extends CheckoutModel {
  const factory _CheckoutModel(
      {required final Address? selectedAddress,
      final ProductPaymentMethod paymentMethod,
      required final CardDetail? cardDetail,
      required final String? paymentId}) = _$_CheckoutModel;
  const _CheckoutModel._() : super._();

  @override
  Address? get selectedAddress;
  @override
  ProductPaymentMethod get paymentMethod;
  @override
  CardDetail? get cardDetail;
  @override
  String? get paymentId;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutModelCopyWith<_$_CheckoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}
