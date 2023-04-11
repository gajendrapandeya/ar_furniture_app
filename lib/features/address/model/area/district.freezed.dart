// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$District {
  int get districtId => throw _privateConstructorUsedError;
  int get stateId => throw _privateConstructorUsedError;
  String get districtName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({int districtId, int stateId, String districtName});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtId = null,
    Object? stateId = null,
    Object? districtName = null,
  }) {
    return _then(_value.copyWith(
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistrictCopyWith<$Res> implements $DistrictCopyWith<$Res> {
  factory _$$_DistrictCopyWith(
          _$_District value, $Res Function(_$_District) then) =
      __$$_DistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int districtId, int stateId, String districtName});
}

/// @nodoc
class __$$_DistrictCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$_District>
    implements _$$_DistrictCopyWith<$Res> {
  __$$_DistrictCopyWithImpl(
      _$_District _value, $Res Function(_$_District) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtId = null,
    Object? stateId = null,
    Object? districtName = null,
  }) {
    return _then(_$_District(
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_District implements _District {
  const _$_District(
      {required this.districtId,
      required this.stateId,
      required this.districtName});

  @override
  final int districtId;
  @override
  final int stateId;
  @override
  final String districtName;

  @override
  String toString() {
    return 'District(districtId: $districtId, stateId: $stateId, districtName: $districtName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_District &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, districtId, stateId, districtName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      __$$_DistrictCopyWithImpl<_$_District>(this, _$identity);
}

abstract class _District implements District {
  const factory _District(
      {required final int districtId,
      required final int stateId,
      required final String districtName}) = _$_District;

  @override
  int get districtId;
  @override
  int get stateId;
  @override
  String get districtName;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      throw _privateConstructorUsedError;
}
