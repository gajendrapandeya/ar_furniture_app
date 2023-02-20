// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hot_deal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HotDeal _$HotDealFromJson(Map<String, dynamic> json) {
  return _HotDeal.fromJson(json);
}

/// @nodoc
mixin _$HotDeal {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get hashTag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotDealCopyWith<HotDeal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotDealCopyWith<$Res> {
  factory $HotDealCopyWith(HotDeal value, $Res Function(HotDeal) then) =
      _$HotDealCopyWithImpl<$Res, HotDeal>;
  @useResult
  $Res call({String id, String imageUrl, String description, String hashTag});
}

/// @nodoc
class _$HotDealCopyWithImpl<$Res, $Val extends HotDeal>
    implements $HotDealCopyWith<$Res> {
  _$HotDealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? hashTag = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hashTag: null == hashTag
          ? _value.hashTag
          : hashTag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HotDealCopyWith<$Res> implements $HotDealCopyWith<$Res> {
  factory _$$_HotDealCopyWith(
          _$_HotDeal value, $Res Function(_$_HotDeal) then) =
      __$$_HotDealCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String imageUrl, String description, String hashTag});
}

/// @nodoc
class __$$_HotDealCopyWithImpl<$Res>
    extends _$HotDealCopyWithImpl<$Res, _$_HotDeal>
    implements _$$_HotDealCopyWith<$Res> {
  __$$_HotDealCopyWithImpl(_$_HotDeal _value, $Res Function(_$_HotDeal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? hashTag = null,
  }) {
    return _then(_$_HotDeal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hashTag: null == hashTag
          ? _value.hashTag
          : hashTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HotDeal implements _HotDeal {
  const _$_HotDeal(
      {required this.id,
      required this.imageUrl,
      required this.description,
      required this.hashTag});

  factory _$_HotDeal.fromJson(Map<String, dynamic> json) =>
      _$$_HotDealFromJson(json);

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final String description;
  @override
  final String hashTag;

  @override
  String toString() {
    return 'HotDeal(id: $id, imageUrl: $imageUrl, description: $description, hashTag: $hashTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HotDeal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hashTag, hashTag) || other.hashTag == hashTag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, imageUrl, description, hashTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HotDealCopyWith<_$_HotDeal> get copyWith =>
      __$$_HotDealCopyWithImpl<_$_HotDeal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HotDealToJson(
      this,
    );
  }
}

abstract class _HotDeal implements HotDeal {
  const factory _HotDeal(
      {required final String id,
      required final String imageUrl,
      required final String description,
      required final String hashTag}) = _$_HotDeal;

  factory _HotDeal.fromJson(Map<String, dynamic> json) = _$_HotDeal.fromJson;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  String get hashTag;
  @override
  @JsonKey(ignore: true)
  _$$_HotDealCopyWith<_$_HotDeal> get copyWith =>
      throw _privateConstructorUsedError;
}
