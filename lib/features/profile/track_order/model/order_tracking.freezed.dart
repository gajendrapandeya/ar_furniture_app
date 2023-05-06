// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTracking _$OrderTrackingFromJson(Map<String, dynamic> json) {
  return _OrderTracking.fromJson(json);
}

/// @nodoc
mixin _$OrderTracking {
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTrackingCopyWith<OrderTracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackingCopyWith<$Res> {
  factory $OrderTrackingCopyWith(
          OrderTracking value, $Res Function(OrderTracking) then) =
      _$OrderTrackingCopyWithImpl<$Res, OrderTracking>;
  @useResult
  $Res call({OrderStatus orderStatus, String updatedAt});
}

/// @nodoc
class _$OrderTrackingCopyWithImpl<$Res, $Val extends OrderTracking>
    implements $OrderTrackingCopyWith<$Res> {
  _$OrderTrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderTrackingCopyWith<$Res>
    implements $OrderTrackingCopyWith<$Res> {
  factory _$$_OrderTrackingCopyWith(
          _$_OrderTracking value, $Res Function(_$_OrderTracking) then) =
      __$$_OrderTrackingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderStatus orderStatus, String updatedAt});
}

/// @nodoc
class __$$_OrderTrackingCopyWithImpl<$Res>
    extends _$OrderTrackingCopyWithImpl<$Res, _$_OrderTracking>
    implements _$$_OrderTrackingCopyWith<$Res> {
  __$$_OrderTrackingCopyWithImpl(
      _$_OrderTracking _value, $Res Function(_$_OrderTracking) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_OrderTracking(
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTracking extends _OrderTracking {
  const _$_OrderTracking({required this.orderStatus, required this.updatedAt})
      : super._();

  factory _$_OrderTracking.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTrackingFromJson(json);

  @override
  final OrderStatus orderStatus;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OrderTracking(orderStatus: $orderStatus, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTracking &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderStatus, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderTrackingCopyWith<_$_OrderTracking> get copyWith =>
      __$$_OrderTrackingCopyWithImpl<_$_OrderTracking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTrackingToJson(
      this,
    );
  }
}

abstract class _OrderTracking extends OrderTracking {
  const factory _OrderTracking(
      {required final OrderStatus orderStatus,
      required final String updatedAt}) = _$_OrderTracking;
  const _OrderTracking._() : super._();

  factory _OrderTracking.fromJson(Map<String, dynamic> json) =
      _$_OrderTracking.fromJson;

  @override
  OrderStatus get orderStatus;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTrackingCopyWith<_$_OrderTracking> get copyWith =>
      throw _privateConstructorUsedError;
}
