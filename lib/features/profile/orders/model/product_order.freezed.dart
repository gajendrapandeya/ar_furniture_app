// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$ProductOrder {
  String get orderId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<Cart> get products => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  Address get userAddress => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<OrderTracking> get trackings => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  ProductPaymentMethod get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOrderCopyWith<ProductOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOrderCopyWith<$Res> {
  factory $ProductOrderCopyWith(
          ProductOrder value, $Res Function(ProductOrder) then) =
      _$ProductOrderCopyWithImpl<$Res, ProductOrder>;
  @useResult
  $Res call(
      {String orderId,
      String userId,
      List<Cart> products,
      int totalAmount,
      Address userAddress,
      String? paymentId,
      String createdAt,
      List<OrderTracking> trackings,
      String updatedAt,
      OrderStatus orderStatus,
      ProductPaymentMethod paymentMethod});

  $AddressCopyWith<$Res> get userAddress;
}

/// @nodoc
class _$ProductOrderCopyWithImpl<$Res, $Val extends ProductOrder>
    implements $ProductOrderCopyWith<$Res> {
  _$ProductOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? userId = null,
    Object? products = null,
    Object? totalAmount = null,
    Object? userAddress = null,
    Object? paymentId = freezed,
    Object? createdAt = null,
    Object? trackings = null,
    Object? updatedAt = null,
    Object? orderStatus = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      userAddress: null == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      trackings: null == trackings
          ? _value.trackings
          : trackings // ignore: cast_nullable_to_non_nullable
              as List<OrderTracking>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as ProductPaymentMethod,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get userAddress {
    return $AddressCopyWith<$Res>(_value.userAddress, (value) {
      return _then(_value.copyWith(userAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $ProductOrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String userId,
      List<Cart> products,
      int totalAmount,
      Address userAddress,
      String? paymentId,
      String createdAt,
      List<OrderTracking> trackings,
      String updatedAt,
      OrderStatus orderStatus,
      ProductPaymentMethod paymentMethod});

  @override
  $AddressCopyWith<$Res> get userAddress;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res>
    extends _$ProductOrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? userId = null,
    Object? products = null,
    Object? totalAmount = null,
    Object? userAddress = null,
    Object? paymentId = freezed,
    Object? createdAt = null,
    Object? trackings = null,
    Object? updatedAt = null,
    Object? orderStatus = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$_Order(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      userAddress: null == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      trackings: null == trackings
          ? _value._trackings
          : trackings // ignore: cast_nullable_to_non_nullable
              as List<OrderTracking>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as ProductPaymentMethod,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order extends _Order {
  const _$_Order(
      {required this.orderId,
      required this.userId,
      required final List<Cart> products,
      required this.totalAmount,
      required this.userAddress,
      required this.paymentId,
      required this.createdAt,
      required final List<OrderTracking> trackings,
      required this.updatedAt,
      required this.orderStatus,
      required this.paymentMethod})
      : _products = products,
        _trackings = trackings,
        super._();

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String orderId;
  @override
  final String userId;
  final List<Cart> _products;
  @override
  List<Cart> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int totalAmount;
  @override
  final Address userAddress;
  @override
  final String? paymentId;
  @override
  final String createdAt;
  final List<OrderTracking> _trackings;
  @override
  List<OrderTracking> get trackings {
    if (_trackings is EqualUnmodifiableListView) return _trackings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackings);
  }

  @override
  final String updatedAt;
  @override
  final OrderStatus orderStatus;
  @override
  final ProductPaymentMethod paymentMethod;

  @override
  String toString() {
    return 'ProductOrder(orderId: $orderId, userId: $userId, products: $products, totalAmount: $totalAmount, userAddress: $userAddress, paymentId: $paymentId, createdAt: $createdAt, trackings: $trackings, updatedAt: $updatedAt, orderStatus: $orderStatus, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.userAddress, userAddress) ||
                other.userAddress == userAddress) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._trackings, _trackings) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      userId,
      const DeepCollectionEquality().hash(_products),
      totalAmount,
      userAddress,
      paymentId,
      createdAt,
      const DeepCollectionEquality().hash(_trackings),
      updatedAt,
      orderStatus,
      paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order extends ProductOrder {
  const factory _Order(
      {required final String orderId,
      required final String userId,
      required final List<Cart> products,
      required final int totalAmount,
      required final Address userAddress,
      required final String? paymentId,
      required final String createdAt,
      required final List<OrderTracking> trackings,
      required final String updatedAt,
      required final OrderStatus orderStatus,
      required final ProductPaymentMethod paymentMethod}) = _$_Order;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String get orderId;
  @override
  String get userId;
  @override
  List<Cart> get products;
  @override
  int get totalAmount;
  @override
  Address get userAddress;
  @override
  String? get paymentId;
  @override
  String get createdAt;
  @override
  List<OrderTracking> get trackings;
  @override
  String get updatedAt;
  @override
  OrderStatus get orderStatus;
  @override
  ProductPaymentMethod get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
